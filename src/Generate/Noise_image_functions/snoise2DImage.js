/**
 * Snoise 2D Image
 * - vec4 snoise2DImage(vec2 uv, float scal, float gain, float ofst, vec2 move)
 * - vec4 snoise2DImage(vec2 uv, float scal, float gain, float ofst, float expo, vec2 move)
 * @type {string}
 */
export const snoise2DImage = `
	// MIT License
	// Copyright © 2023 Zaron
	// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	vec4 snoise2DImage(vec2 uv, float scal, float gain, float ofst, vec2 move) {
		uv *= scal;
		float R = snoise(uv+move+vec2(100.));
		float G = snoise(uv+move+vec2(300.));
		float B = snoise(uv+move+vec2(500.));
		vec3 color = ofst+gain*vec3(R, G, B);
		return vec4(color, 1.);
	}

	vec4 snoise2DImage(vec2 uv, float scal, float gain, float ofst, float expo, vec2 move) {
		uv *= scal;
		float R = snoise(uv+move+vec2(100.));
		float G = snoise(uv+move+vec2(300.));
		float B = snoise(uv+move+vec2(500.));
		vec3 col;
		col.r = pow(abs(R), expo)*(step(0., R)*2.-1.);
		col.g = pow(abs(G), expo)*(step(0., G)*2.-1.);
		col.b = pow(abs(B), expo)*(step(0., B)*2.-1.);
		return vec4(ofst+gain*col, 1.);
	}
`
