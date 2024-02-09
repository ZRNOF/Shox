// The algorithm is based on the approach described in the blog post:
// Efficient Gaussian blur with linear sampling: https://www.rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/
//
// MIT License
// Copyright © 2024 Zaron Chen
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function PascalsTriangleRow(n) {
	if (n === 0) return [1]
	const row = [1]
	const prevRow = PascalsTriangleRow(n - 1)
	for (let i = 1; i < n; i++) row[i] = prevRow[i - 1] + (prevRow[i] || 0)
	row.push(1)
	return row
}

const generateWeightOffset = (size) => {
	const n = size * 2 + 3
	const wei = PascalsTriangleRow(n - 1).map((e) => e / (2 ** (n - 1) - n * 2))
	const weight = []
	const offset = []
	let f = -size + 1
	for (let i = 2; i <= size - 1; i += 2) {
		const w = wei[i] + wei[i + 1]
		weight.push(w)
		offset.push((f * wei[i] + (f + 1) * wei[i + 1]) / w)
		f += 2
	}
	weight.push(wei[size + 1])
	offset.push(0)
	weight.push(...weight.slice(0, weight.length - 1).reverse())
	offset.push(
		...offset
			.slice(0, offset.length - 1)
			.reverse()
			.map((e) => -e)
	)
	return { weight, offset }
}

/**
 * Gaussian blur (linear sampling, ref: https://www.rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/)
 * - vec4 blur(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction)
 * @param {number} radius - The radius of the convolution kernel. The kernel size is radius * 2 + 1.
 * @returns {string}
 */
export const blur = (radius) => {
	const KERNEL_SIZE = Math.ceil(Math.max(radius, 1)) * 2 + 1
	const { weight, offset } = generateWeightOffset(KERNEL_SIZE)
	return `
		vec4 blur(vec2 uv, sampler2D tex, vec2 texelSize, vec2 direction) {
			vec4 color = vec4(0.0);
			texelSize *= direction;
			${weight
				.map((_, i) => {
					return `color += ${weight[i]}*texture( tex, uv+vec2( ${offset[i]} )*texelSize );`
				})
				.join("")}
			return color;
		}
	`
}
