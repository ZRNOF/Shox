/**
 * Dither
 * - float dither5(float t, vec2 coord)
 * - float dither17(float t, vec2 coord)
 * @type {string}
 */
export const dither = `
	// The algorithm is based on Wikipedia:
	// Ordered dithering: https://en.wikipedia.org/wiki/Ordered_dithering
	//
	// MIT License
	// Copyright © 2024 Zaron Chen
	// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	const float Bayer2x2[4] = float[](0., 2., 3., 1.);
	const float Bayer4x4[16] = float[](0., 8., 2., 10., 12., 4., 14., 6., 3., 11., 1., 9., 15., 7., 13., 5.);

	float dither5(float t, vec2 coord) {
		ivec2 g = ivec2(mod(coord, 2.));
		int i = g.x+g.y*2;
		float v = round(t*4.)/4.;
		return v>Bayer2x2[i]/4. ? 1. : 0.;
	}

	float dither17(float t, vec2 coord) {
		ivec2 g = ivec2(mod(coord, 4.));
		int i = g.x+g.y*4;
		float v = round(t*16.)/16.;
		return v>Bayer4x4[i]/16. ? 1. : 0.;
	}
`
