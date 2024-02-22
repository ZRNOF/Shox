// The implementation is based on Wikipedia:
// Image embossing: https://en.wikipedia.org/wiki/Image_embossing
//
// MIT License
// Copyright © 2024 Zaron Chen
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

vec3 emboss2H(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, uv+vec2(-1., 0.)*texelSize).rgb;
	result += -strength*texture(tex, uv+vec2(1., 0.)*texelSize).rgb;
	return result;
}

vec3 emboss2HWrap(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, fract(uv+vec2(-1., 0.)*texelSize)).rgb;
	result += -strength*texture(tex, fract(uv+vec2(1., 0.)*texelSize)).rgb;
	return result;
}

vec3 emboss2V(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, uv+vec2(0.,-1.)*texelSize).rgb;
	result += -strength*texture(tex, uv+vec2(0., 1.)*texelSize).rgb;
	return result;
}

vec3 emboss2VWrap(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, fract(uv+vec2(0.,-1.)*texelSize)).rgb;
	result += -strength*texture(tex, fract(uv+vec2(0., 1.)*texelSize)).rgb;
	return result;
}

vec3 emboss2SA(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, uv+vec2(-1.,-1.)*texelSize).rgb;
	result += -strength*texture(tex, uv+vec2(1., 1.)*texelSize).rgb;
	return result;
}

vec3 emboss2SAWrap(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, fract(uv+vec2(-1.,-1.)*texelSize)).rgb;
	result += -strength*texture(tex, fract(uv+vec2(1., 1.)*texelSize)).rgb;
	return result;
}

vec3 emboss2SB(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, uv+vec2(1.,-1.)*texelSize).rgb;
	result += -strength*texture(tex, uv+vec2(-1., 1.)*texelSize).rgb;
	return result;
}

vec3 emboss2SBWrap(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += strength*texture(tex, fract(uv+vec2(1.,-1.)*texelSize)).rgb;
	result += -strength*texture(tex, fract(uv+vec2(-1., 1.)*texelSize)).rgb;
	return result;
}

vec3 emboss6SA(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += -2.*strength*texture(tex, uv+vec2(-1.,-1.)*texelSize).rgb;
	result += -1.*strength*texture(tex, uv+vec2(0.,-1.)*texelSize).rgb;
	result += -1.*strength*texture(tex, uv+vec2(-1., 0.)*texelSize).rgb;
	result += 1.*strength*texture(tex, uv+vec2(1., 0.)*texelSize).rgb;
	result += 1.*strength*texture(tex, uv+vec2(0., 1.)*texelSize).rgb;
	result += 2.*strength*texture(tex, uv+vec2(1., 1.)*texelSize).rgb;
	return result;
}

vec3 emboss6SAWrap(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += -2.*strength*texture(tex, fract(uv+vec2(-1.,-1.)*texelSize)).rgb;
	result += -1.*strength*texture(tex, fract(uv+vec2(0.,-1.)*texelSize)).rgb;
	result += -1.*strength*texture(tex, fract(uv+vec2(-1., 0.)*texelSize)).rgb;
	result += 1.*strength*texture(tex, fract(uv+vec2(1., 0.)*texelSize)).rgb;
	result += 1.*strength*texture(tex, fract(uv+vec2(0., 1.)*texelSize)).rgb;
	result += 2.*strength*texture(tex, fract(uv+vec2(1., 1.)*texelSize)).rgb;
	return result;
}

vec3 emboss6SB(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += -1.*strength*texture(tex, uv+vec2(0.,-1.)*texelSize).rgb;
	result += -2.*strength*texture(tex, uv+vec2(1.,-1.)*texelSize).rgb;
	result += 1.*strength*texture(tex, uv+vec2(-1., 0.)*texelSize).rgb;
	result += -1.*strength*texture(tex, uv+vec2(1., 0.)*texelSize).rgb;
	result += 2.*strength*texture(tex, uv+vec2(-1., 1.)*texelSize).rgb;
	result += 1.*strength*texture(tex, uv+vec2(0., 1.)*texelSize).rgb;
	return result;
}

vec3 emboss6SBWrap(vec2 uv, sampler2D tex, vec2 texelSize, float strength) {
	vec3 result = vec3(0.);
	result += -1.*strength*texture(tex, fract(uv+vec2(0.,-1.)*texelSize)).rgb;
	result += -2.*strength*texture(tex, fract(uv+vec2(1.,-1.)*texelSize)).rgb;
	result += 1.*strength*texture(tex, fract(uv+vec2(-1., 0.)*texelSize)).rgb;
	result += -1.*strength*texture(tex, fract(uv+vec2(1., 0.)*texelSize)).rgb;
	result += 2.*strength*texture(tex, fract(uv+vec2(-1., 1.)*texelSize)).rgb;
	result += 1.*strength*texture(tex, fract(uv+vec2(0., 1.)*texelSize)).rgb;
	return result;
}
