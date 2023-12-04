// MIT License
// Copyright © 2023 Zaron
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

float pulse(float start, float end) {
	return step(0., start)*step(end, 0.);
}

vec4 grad(float area, vec4 startCol, vec4 endCol, float startPos, float endPos) {
	float u = pulse(area-startPos, area-endPos);
	vec4 gradientCol = mix(startCol, endCol, (area-startPos)/(endPos-startPos))*u;
	return gradientCol;
}

// vec4 colors[] - define your colors
// float positions[] - define positions of your colors (0.0 - 1.0)
vec4 palette(float t, vec4 colors[5], float positions[5]) {
	vec4 result_color = vec4(0.);
	for (int i = 0; i<colors.length()-1; i++) {
		result_color += grad(t, colors[i], colors[i+1], positions[i], positions[i+1]);
	}
	return result_color;
}

/* -------------------------------------------------- */

// The MIT License
// https://iquilezles.org/
// Copyright © 2015 Inigo Quilez
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// See https://iquilezles.org/articles/palettes for more information

// float t: 0 to 1
// vec3 a: brightness
// vec3 b: constrast
// vec3 c: oscilates times
// vec3 d: phase
vec3 palette(in float t, in vec3 a, in vec3 b, in vec3 c, in vec3 d) {
	return a+b*cos(6.28318*(c*t+d));
}
