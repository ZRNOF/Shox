// ref: https://github.com/stegu/webgl-noise/blob/master/src/noise2D.glsl

/**
 * Snoise 2D
 * - float snoise(vec2 v)
 * @type {string}
 */
export const snoise2D = `
	/*
		Description : Array and textureless GLSL 2D simplex noise functions.
		     Author : Ian McEwan, Ashima Arts.
		 Maintainer : stegu
		    Lastmod : 20110822 (ijm)
		    License : Copyright (C) 2011 Ashima Arts. All rights reserved.
		              Distributed under the MIT License. See LICENSE file.
		              https://github.com/ashima/webgl-noise
		              https://github.com/stegu/webgl-noise

		Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
		The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	*/

	float snoise(vec2 v) {
		const vec4 C = vec4(0.211324865405187,
		                    0.366025403784439,
		                   -0.577350269189626,
		                    0.024390243902439);

		vec2 i  = floor(v + dot(v, C.yy) );
		vec2 x0 = v -   i + dot(i, C.xx);

		vec2 i1;
		i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
		vec4 x12 = x0.xyxy + C.xxzz;
		x12.xy -= i1;

		i = mod289(i);
		vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 ))
			+ i.x + vec3(0.0, i1.x, 1.0 ));

		vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);
		m = m*m ;
		m = m*m ;

		vec3 x = 2.0 * fract(p * C.www) - 1.0;
		vec3 h = abs(x) - 0.5;
		vec3 ox = floor(x + 0.5);
		vec3 a0 = x - ox;

		m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );

		vec3 g;
		g.x  = a0.x  * x0.x  + h.x  * x0.y;
		g.yz = a0.yz * x12.xz + h.yz * x12.yw;
		return 130.0 * dot(m, g);
	}
`
