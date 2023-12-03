// MIT License
// Copyright © 2023 Zaron
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

vec4 hold(vec2 uv, sampler2D img) {
	return texture(img, uv);
}

vec4 mirror(vec2 uv, sampler2D img) {
	vec2 iuv = floor(uv);
	uv *= 1.-2.*mod(iuv, 2.);
	return texture(img, fract(uv));
}

vec4 one(vec2 uv, sampler2D img) {
	if (0.<=uv.x&&uv.x<=1.&&0.<=uv.y&&uv.y<=1.) {
		return texture(img, uv);
	} else {
		return vec4(1.);
	}
}

vec4 repeat(vec2 uv, sampler2D img) {
	return texture(img, fract(uv));
}

vec4 zero(vec2 uv, sampler2D img) {
	if (0.<=uv.x&&uv.x<=1.&&0.<=uv.y&&uv.y<=1.) {
		return texture(img, uv);
	} else {
		return vec4(0.);
	}
}
