// The algorithm is based on the approach described in the blog post:
// Efficient Gaussian blur with linear sampling: https://www.rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/
//
// MIT License
// Copyright © 2024 Zaron Chen
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

vec4 blur3(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction) {
	vec4 color = vec4(0.0);
	texelSize *= direction;
	color += 0.3529411764705882*texture(tex, uv+vec2(-1.3333333333333335)*texelSize);
	color += 0.29411764705882354*texture(tex, uv+vec2(0.)*texelSize);
	color += 0.3529411764705882*texture(tex, uv+vec2(1.3333333333333335)*texelSize);
	return color;
}

vec4 blur7(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction) {
	vec4 color = vec4(0.0);
	texelSize *= direction;
	color += 0.010381362401148057*texture(tex, uv+vec2(-5.1764705882352935)*texelSize);
	color += 0.09447039785044732*texture(tex, uv+vec2(-3.294117647058824)*texelSize);
	color += 0.2969069646728344*texture(tex, uv+vec2(-1.411764705882353)*texelSize);
	color += 0.1964825501511404*texture(tex, uv+vec2(0.)*texelSize);
	color += 0.2969069646728344*texture(tex, uv+vec2(1.411764705882353)*texelSize);
	color += 0.09447039785044732*texture(tex, uv+vec2(3.294117647058824)*texelSize);
	color += 0.010381362401148057*texture(tex, uv+vec2(5.1764705882352935)*texelSize);
	return color;
}

vec4 blur11(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction) {
	vec4 color = vec4(0.0);
	texelSize *= direction;
	color += 0.0001370910915466891*texture(tex, uv+vec2(-9.12)*texelSize);
	color += 0.0031668042147285184*texture(tex, uv+vec2(-7.199999999999999)*texelSize);
	color += 0.028652038133258024*texture(tex, uv+vec2(-5.279999999999999)*texelSize);
	color += 0.1217711620663466*texture(tex, uv+vec2(-3.3600000000000003)*texelSize);
	color += 0.2656825354174835*texture(tex, uv+vec2(-1.44)*texelSize);
	color += 0.16118073815327333*texture(tex, uv+vec2(0.)*texelSize);
	color += 0.2656825354174835*texture(tex, uv+vec2(1.44)*texelSize);
	color += 0.1217711620663466*texture(tex, uv+vec2(3.3600000000000003)*texelSize);
	color += 0.028652038133258024*texture(tex, uv+vec2(5.279999999999999)*texelSize);
	color += 0.0031668042147285184*texture(tex, uv+vec2(7.199999999999999)*texelSize);
	color += 0.0001370910915466891*texture(tex, uv+vec2(9.12)*texelSize);
	return color;
}

vec4 blur15(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction) {
	vec4 color = vec4(0.0);
	texelSize *= direction;
	color += 0.0000012703240112963562*texture(tex, uv+vec2(-13.090909090909092)*texelSize);
	color += 0.0000552590944913915*texture(tex, uv+vec2(-11.15151515151515)*texelSize);
	color += 0.000994663700845047*texture(tex, uv+vec2(-9.212121212121211)*texelSize);
	color += 0.008979602854851118*texture(tex, uv+vec2(-7.272727272727273)*texelSize);
	color += 0.04506127978070743*texture(tex, uv+vec2(-5.333333333333334)*texelSize);
	color += 0.13345071319671048*texture(tex, uv+vec2(-3.3939393939393936)*texelSize);
	color += 0.24148224292738082*texture(tex, uv+vec2(-1.4545454545454546)*texelSize);
	color += 0.1399499362420048*texture(tex, uv+vec2(0.)*texelSize);
	color += 0.24148224292738082*texture(tex, uv+vec2(1.4545454545454546)*texelSize);
	color += 0.13345071319671048*texture(tex, uv+vec2(3.3939393939393936)*texelSize);
	color += 0.04506127978070743*texture(tex, uv+vec2(5.333333333333334)*texelSize);
	color += 0.008979602854851118*texture(tex, uv+vec2(7.272727272727273)*texelSize);
	color += 0.000994663700845047*texture(tex, uv+vec2(9.212121212121211)*texelSize);
	color += 0.0000552590944913915*texture(tex, uv+vec2(11.15151515151515)*texelSize);
	color += 0.0000012703240112963562*texture(tex, uv+vec2(13.090909090909092)*texelSize);
	return color;
}

vec4 blur19(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction) {
	vec4 color = vec4(0.0);
	texelSize *= direction;
	color += 9.69521352162247e-9*texture(tex, uv+vec2(-17.07317073170732)*texelSize);
	color += 6.815735105700596e-7*texture(tex, uv+vec2(-15.121951219512194)*texelSize);
	color += 0.00002044720531710179*texture(tex, uv+vec2(-13.170731707317072)*texelSize);
	color += 0.0003186356161915029*texture(tex, uv+vec2(-11.21951219512195)*texelSize);
	color += 0.0028735139205633715*texture(tex, uv+vec2(-9.268292682926829)*texelSize);
	color += 0.01602536609544957*texture(tex, uv+vec2(-7.3170731707317085)*texelSize);
	color += 0.05769131794361845*texture(tex, uv+vec2(-5.365853658536586)*texelSize);
	color += 0.13786528185055882*texture(tex, uv+vec2(-3.4146341463414633)*texelSize);
	color += 0.22251940228511247*texture(tex, uv+vec2(-1.4634146341463414)*texelSize);
	color += 0.12537068762892922*texture(tex, uv+vec2(0.)*texelSize);
	color += 0.22251940228511247*texture(tex, uv+vec2(1.4634146341463414)*texelSize);
	color += 0.13786528185055882*texture(tex, uv+vec2(3.4146341463414633)*texelSize);
	color += 0.05769131794361845*texture(tex, uv+vec2(5.365853658536586)*texelSize);
	color += 0.01602536609544957*texture(tex, uv+vec2(7.3170731707317085)*texelSize);
	color += 0.0028735139205633715*texture(tex, uv+vec2(9.268292682926829)*texelSize);
	color += 0.0003186356161915029*texture(tex, uv+vec2(11.21951219512195)*texelSize);
	color += 0.00002044720531710179*texture(tex, uv+vec2(13.170731707317072)*texelSize);
	color += 6.815735105700596e-7*texture(tex, uv+vec2(15.121951219512194)*texelSize);
	color += 9.69521352162247e-9*texture(tex, uv+vec2(17.07317073170732)*texelSize);
	return color;
}

vec4 blur23(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction) {
	vec4 color = vec4(0.0);
	texelSize *= direction;
	color += 6.545519681824322e-11*texture(tex, uv+vec2(-21.061224489795915)*texelSize);
	color += 6.7746128706881735e-9*texture(tex, uv+vec2(-19.10204081632653)*texelSize);
	color += 3.051801797938577e-7*texture(tex, uv+vec2(-17.142857142857146)*texelSize);
	color += 0.000007298892633403097*texture(tex, uv+vec2(-15.183673469387756)*texelSize);
	color += 0.00010351156825553482*texture(tex, uv+vec2(-13.224489795918368)*texelSize);
	color += 0.0009329311856877049*texture(tex, uv+vec2(-11.26530612244898)*texelSize);
	color += 0.0055975871141262295*texture(tex, uv+vec2(-9.306122448979592)*texelSize);
	color += 0.023090046845770696*texture(tex, uv+vec2(-7.346938775510204)*texelSize);
	color += 0.06697463880410681*texture(tex, uv+vec2(-5.387755102040815)*texelSize);
	color += 0.13873318037993554*texture(tex, uv+vec2(-3.428571428571429)*texelSize);
	color += 0.20727724183247287*texture(tex, uv+vec2(-1.4693877551020407)*texelSize);
	color += 0.11456650271352667*texture(tex, uv+vec2(0.)*texelSize);
	color += 0.20727724183247287*texture(tex, uv+vec2(1.4693877551020407)*texelSize);
	color += 0.13873318037993554*texture(tex, uv+vec2(3.428571428571429)*texelSize);
	color += 0.06697463880410681*texture(tex, uv+vec2(5.387755102040815)*texelSize);
	color += 0.023090046845770696*texture(tex, uv+vec2(7.346938775510204)*texelSize);
	color += 0.0055975871141262295*texture(tex, uv+vec2(9.306122448979592)*texelSize);
	color += 0.0009329311856877049*texture(tex, uv+vec2(11.26530612244898)*texelSize);
	color += 0.00010351156825553482*texture(tex, uv+vec2(13.224489795918368)*texelSize);
	color += 0.000007298892633403097*texture(tex, uv+vec2(15.183673469387756)*texelSize);
	color += 3.051801797938577e-7*texture(tex, uv+vec2(17.142857142857146)*texelSize);
	color += 6.7746128706881735e-9*texture(tex, uv+vec2(19.10204081632653)*texelSize);
	color += 6.545519681824322e-11*texture(tex, uv+vec2(21.061224489795915)*texelSize);
	return color;
}
