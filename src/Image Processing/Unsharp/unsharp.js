/**
 * Unsharp masking (USM)
 * - vec4 unsharp(vec2 uv, sampler2D originalTexture, sampler2D blurredTexture, float strength)
 * - vec4 unsharp(vec2 uv, sampler2D img, vec2 texelSize, float strength)
 * @type {string}
 */
export const unsharp = `
	// The algorithm is based on Wikipedia:
	// Kernel (image processing): https://en.wikipedia.org/wiki/Kernel_(image_processing)
	//
	// MIT License
	// Copyright © 2023 Zaron Chen
	// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	// Applies unsharp by combining the original and blurred textures.
	vec4 unsharp(vec2 uv, sampler2D originalTexture, sampler2D blurredTexture, float strength) {
		vec4 o = texture(originalTexture, uv);
		vec4 b = texture(blurredTexture, uv);
		return o+strength*(o-b);
	}

	// Applies unsharp by convolving the image with a kernel.
	vec4 unsharp(vec2 uv, sampler2D img, vec2 texelSize, float strength) {
		vec4 color = vec4(0.0);
		float center = -220.-strength;

		color +=     1.*texture( img, uv+vec2( -2., -2. )*texelSize );
		color +=     4.*texture( img, uv+vec2( -1., -2. )*texelSize );
		color +=     6.*texture( img, uv+vec2(  0., -2. )*texelSize );
		color +=     4.*texture( img, uv+vec2(  1., -2. )*texelSize );
		color +=     1.*texture( img, uv+vec2(  2., -2. )*texelSize );
		color +=     4.*texture( img, uv+vec2( -2., -1. )*texelSize );
		color +=    16.*texture( img, uv+vec2( -1., -1. )*texelSize );
		color +=    24.*texture( img, uv+vec2(  0., -1. )*texelSize );
		color +=    16.*texture( img, uv+vec2(  1., -1. )*texelSize );
		color +=     4.*texture( img, uv+vec2(  2., -1. )*texelSize );
		color +=     6.*texture( img, uv+vec2( -2.,  0. )*texelSize );
		color +=    24.*texture( img, uv+vec2( -1.,  0. )*texelSize );
		color += center*texture( img, uv+vec2(  0.,  0. )*texelSize );
		color +=    24.*texture( img, uv+vec2(  1.,  0. )*texelSize );
		color +=     6.*texture( img, uv+vec2(  2.,  0. )*texelSize );
		color +=     4.*texture( img, uv+vec2( -2.,  1. )*texelSize );
		color +=    16.*texture( img, uv+vec2( -1.,  1. )*texelSize );
		color +=    24.*texture( img, uv+vec2(  0.,  1. )*texelSize );
		color +=    16.*texture( img, uv+vec2(  1.,  1. )*texelSize );
		color +=     4.*texture( img, uv+vec2(  2.,  1. )*texelSize );
		color +=     1.*texture( img, uv+vec2( -2.,  2. )*texelSize );
		color +=     4.*texture( img, uv+vec2( -1.,  2. )*texelSize );
		color +=     6.*texture( img, uv+vec2(  0.,  2. )*texelSize );
		color +=     4.*texture( img, uv+vec2(  1.,  2. )*texelSize );
		color +=     1.*texture( img, uv+vec2(  2.,  2. )*texelSize );

		return color/(-strength);
	}
`
