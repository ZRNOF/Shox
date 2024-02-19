// The implementation is based on Wikipedia:
// Discrete Laplace operator: https://en.wikipedia.org/wiki/Discrete_Laplace_operator
//
// MIT License
// Copyright © 2024 Zaron Chen
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

vec2 laplacian5(vec2 uv, sampler2D tex, vec2 texelSize) {
	vec2 sum = vec2(0.);
	sum += 1.*texture(tex, uv+vec2(-1., 0.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(0.,-1.)*texelSize).xy;
	sum += -4.*texture(tex, uv+vec2(0., 0.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(0., 1.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(1., 0.)*texelSize).xy;
	return sum;
}

vec2 laplacian5Wrap(vec2 uv, sampler2D tex, vec2 texelSize) {
	vec2 sum = vec2(0.);
	sum += 1.*texture(tex, fract(uv+vec2(-1., 0.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(0.,-1.)*texelSize)).xy;
	sum += -4.*texture(tex, fract(uv+vec2(0., 0.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(0., 1.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(1., 0.)*texelSize)).xy;
	return sum;
}

vec2 laplacian9(vec2 uv, sampler2D tex, vec2 texelSize) {
	vec2 sum = vec2(0.);
	sum += 1.*texture(tex, uv+vec2(-1.,-1.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(-1., 0.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(-1., 1.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(0.,-1.)*texelSize).xy;
	sum += -8.*texture(tex, uv+vec2(0., 0.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(0., 1.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(1.,-1.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(1., 0.)*texelSize).xy;
	sum += 1.*texture(tex, uv+vec2(1., 1.)*texelSize).xy;
	return sum;
}

vec2 laplacian9Wrap(vec2 uv, sampler2D tex, vec2 texelSize) {
	vec2 sum = vec2(0.);
	sum += 1.*texture(tex, fract(uv+vec2(-1.,-1.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(-1., 0.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(-1., 1.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(0.,-1.)*texelSize)).xy;
	sum += -8.*texture(tex, fract(uv+vec2(0., 0.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(0., 1.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(1.,-1.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(1., 0.)*texelSize)).xy;
	sum += 1.*texture(tex, fract(uv+vec2(1., 1.)*texelSize)).xy;
	return sum;
}

vec2 laplacianS(vec2 uv, sampler2D tex, vec2 texelSize) {
	vec2 sum = vec2(0.);
	sum += .25*texture(tex, uv+vec2(-1.,-1.)*texelSize).xy;
	sum += .5*texture(tex, uv+vec2(-1., 0.)*texelSize).xy;
	sum += .25*texture(tex, uv+vec2(-1., 1.)*texelSize).xy;
	sum += .5*texture(tex, uv+vec2(0.,-1.)*texelSize).xy;
	sum += -3.*texture(tex, uv+vec2(0., 0.)*texelSize).xy;
	sum += .5*texture(tex, uv+vec2(0., 1.)*texelSize).xy;
	sum += .25*texture(tex, uv+vec2(1.,-1.)*texelSize).xy;
	sum += .5*texture(tex, uv+vec2(1., 0.)*texelSize).xy;
	sum += .25*texture(tex, uv+vec2(1., 1.)*texelSize).xy;
	return sum;
}

vec2 laplacianSWrap(vec2 uv, sampler2D tex, vec2 texelSize) {
	vec2 sum = vec2(0.);
	sum += .25*texture(tex, fract(uv+vec2(-1.,-1.)*texelSize)).xy;
	sum += .5*texture(tex, fract(uv+vec2(-1., 0.)*texelSize)).xy;
	sum += .25*texture(tex, fract(uv+vec2(-1., 1.)*texelSize)).xy;
	sum += .5*texture(tex, fract(uv+vec2(0.,-1.)*texelSize)).xy;
	sum += -3.*texture(tex, fract(uv+vec2(0., 0.)*texelSize)).xy;
	sum += .5*texture(tex, fract(uv+vec2(0., 1.)*texelSize)).xy;
	sum += .25*texture(tex, fract(uv+vec2(1.,-1.)*texelSize)).xy;
	sum += .5*texture(tex, fract(uv+vec2(1., 0.)*texelSize)).xy;
	sum += .25*texture(tex, fract(uv+vec2(1., 1.)*texelSize)).xy;
	return sum;
}
