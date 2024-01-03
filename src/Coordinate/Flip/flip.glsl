// SPDX-License-Identifier: Unlicense

// flips in the horizontal direction
vec2 flipX(vec2 uv) {
	return vec2(1.0-uv.x, uv.y);
}

// flips in the vertical direction
vec2 flipY(vec2 uv) {
	return vec2(uv.x, 1.0-uv.y);
}
