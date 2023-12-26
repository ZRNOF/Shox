// ref: https://github.com/stegu/webgl-noise/blob/master/src/cellular2D.glsl

/**
 * Cellular 2D
 * - vec2 cellular(vec2 P)
 * @type {string}
 */
export const cellular2D = `
	/*
		Cellular noise ("Worley noise") in 2D in GLSL.
		Copyright (c) Stefan Gustavson 2011-04-19. All rights reserved.
		This code is released under the conditions of the MIT license.
		See LICENSE file for details.
		https://github.com/stegu/webgl-noise

		Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
		The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	*/

	vec2 cellular(vec2 P) {
	#define K 0.142857142857
	#define Ko 0.428571428571
	#define jitter 1.0
		vec2 Pi = mod289(floor(P));
		vec2 Pf = fract(P);
		vec3 oi = vec3(-1.0, 0.0, 1.0);
		vec3 of = vec3(-0.5, 0.5, 1.5);
		vec3 px = permute(Pi.x + oi);
		vec3 p = permute(px.x + Pi.y + oi);
		vec3 ox = fract(p*K) - Ko;
		vec3 oy = mod7(floor(p*K))*K - Ko;
		vec3 dx = Pf.x + 0.5 + jitter*ox;
		vec3 dy = Pf.y - of + jitter*oy;
		vec3 d1 = dx * dx + dy * dy;
		p = permute(px.y + Pi.y + oi);
		ox = fract(p*K) - Ko;
		oy = mod7(floor(p*K))*K - Ko;
		dx = Pf.x - 0.5 + jitter*ox;
		dy = Pf.y - of + jitter*oy;
		vec3 d2 = dx * dx + dy * dy;
		p = permute(px.z + Pi.y + oi);
		ox = fract(p*K) - Ko;
		oy = mod7(floor(p*K))*K - Ko;
		dx = Pf.x - 1.5 + jitter*ox;
		dy = Pf.y - of + jitter*oy;
		vec3 d3 = dx * dx + dy * dy;

		vec3 d1a = min(d1, d2);
		d2 = max(d1, d2);
		d2 = min(d2, d3);
		d1 = min(d1a, d2);
		d2 = max(d1a, d2);
		d1.xy = (d1.x < d1.y) ? d1.xy : d1.yx;
		d1.xz = (d1.x < d1.z) ? d1.xz : d1.zx;
		d1.yz = min(d1.yz, d2.yz);
		d1.y = min(d1.y, d1.z);
		d1.y = min(d1.y, d2.x);
		return sqrt(d1.xy);
	}
`
