// noprotect

/**
 * Pixelate
 * - vec2 pixelate(vec2 uv, vec2 grid)
 * - vec2 pixelate(vec2 uv, vec2 pos, vec2 grid)
 * - vec2 pixelate(vec2 uv, vec2 pos, vec2 size, vec2 grid)
 * @type {string}
 */
export const pixelate = `
	// MIT License
	// Copyright © 2023 Zaron
	// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

	/*
		Applies pixelation effect to the UV coordinates based on the pixel grid.

		Parameters:
			- uv: UV coordinates to be pixelated.
			- grid: Pixel grid. x => column, y => row

		Returns:
			Pixelated UV coordinates.
	*/
	vec2 pixelate(vec2 uv, vec2 grid) {
		uv *= grid;
		vec2 iuv = floor(uv)+.5;  // +.5 to center to cell
		return iuv/grid;
	}

	/*
		Applies pixelation effect to the UV coordinates based on the position of the origin point and the pixel grid.

		Parameters:
			- uv: UV coordinates to be pixelated.
			- pos: Position of the origin point.
			- grid: Pixel grid. x => column, y => row

		Returns:
			Pixelated UV coordinates.
	*/
	vec2 pixelate(vec2 uv, vec2 pos, vec2 grid) {
		uv -= pos;
		uv *= grid;
		vec2 iuv = floor(uv)+.5;  // +.5 to center to cell
		return iuv/grid;
	}

	/*
		Applies pixelation effect to the UV coordinates within a specified area based on the position, size, and pixel grid.
		Returns the original UV coordinates if they are outside the specified area.

		Parameters:
			- uv: UV coordinates to be pixelated.
			- pos: Start position of the pixelated area.
			- size: Size of the pixelated area. x => width, y => height
			- grid: Pixel grid. x => column, y => row

		Returns:
			Pixelated UV coordinates within the specified area or the original UV coordinates if outside the area.
	*/
	vec2 pixelate(vec2 uv, vec2 pos, vec2 size, vec2 grid) {
		if ( pos.x > uv.x || uv.x > pos.x+size.x ||
				 pos.y > uv.y || uv.y > pos.y+size.y ) {
				return uv;
		}
		uv -= pos;
		uv /= size;
		uv *= grid;
		vec2 iuv = floor(uv)+.5;  // +.5 to center to cell
		return iuv/grid*size+pos;
	}
`
