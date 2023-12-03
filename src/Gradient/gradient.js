// noprotect

/**
 * Gradient
 * - vec2 conical(vec2 uv, vec2 pos, float tile, float ofst)
 * - float horizontal(vec2 uv, float tile, float ofst)
 * - float radial(vec2 uv, vec2 pos, float tile, float ofst)
 * - vec2 swirl(vec2 uv, vec2 pos, float tile, float ofst, float wei)
 * - float vertical(vec2 uv, float tile, float ofst)
 * @type {string}
 */
export const gradient = `
	// MIT License
	// Copyright © 2023 Zaron
	// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	#ifndef PI
	#define PI 3.141592653589793
	#endif

	#ifndef TWO_PI
	#define TWO_PI 6.283185307179586
	#endif

	vec2 conical(vec2 uv, vec2 pos, float tile, float ofst) {
		uv -= pos;
		//uv.x *= iResolution.x/iResolution.y;  // square
		vec2 radialUv = vec2(atan(uv.y, uv.x)/TWO_PI+0.5, length(uv));
		radialUv = radialUv*tile-fract(ofst);
		return fract(radialUv);
	}

	float horizontal(vec2 uv, float tile, float ofst) {
		return fract( (uv*tile)-ofst ).x;
	}

	float radial(vec2 uv, vec2 pos, float tile, float ofst) {
		uv -= pos;
		//uv.x *= iResolution.x/iResolution.y;  // square
		float d = length(uv);
		d = d*tile-fract(ofst);
		return fract(d);
	}

	vec2 swirl(vec2 uv, vec2 pos, float tile, float ofst, float wei) {
		uv -= pos;
		//uv.x *= iResolution.x/iResolution.y;  // square
		vec2 radialUv = vec2(atan(uv.y, uv.x)/TWO_PI+0.5, length(uv));
		radialUv.x += radialUv.y*wei;
		radialUv = radialUv*tile-fract(ofst);
		return fract(radialUv);
	}

	float vertical(vec2 uv, float tile, float ofst) {
		return fract( (uv*tile)-ofst ).y;
	}
`
