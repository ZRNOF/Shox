# Shadox

[![NPM Package][npm]][npm-url]

Shader tools.

## Usage

### CDN

```js
import * as Shadox from "https://cdn.jsdelivr.net/npm/shadox@0.1.0/src/Shadox.js"

const frag = `#version 300 es
  precision mediump float;

  uniform vec2 iResolution;
  // ...

  ${Shadox.displace}
  ${Shadox.snoise3D}
  ${Shadox.snoise3DImage}
  ${Shadox.gradient}
  ${Shadox.zcPalette(5)}
  ${Shadox.iqPalette}
  ${Shadox.extend}
  ${Shadox.smooth}

  void main() {
    // ...
  }
`
```

### NPM

```bash
npm i shadox
```

## LICENSE

### MIT license

- Code in this repository are under [the MIT license](https://github.com/ZRNOF/Shadox/blob/main/LICENSE) as long as I am the author of the code.
- Code by other authors will be attributed to the original author with source and license.

### Code in [Generate/Noise_functions](https://github.com/ZRNOF/Shadox/tree/main/src/Generate/Noise_functions/):

- Cellular ("Worley") noise functions are (C) Stefan Gustavson
- Classic noise functions are (C) Stefan Gustavson
- Simplex noise functions are (C) Ashima Arts and Stefan Gustavson
- The "psrdnoise" functions are (C) Stefan Gustavson
- [GitHub - ashima/webgl-noise](https://github.com/ashima/webgl-noise)
- [GitHub - stegu/webgl-noise](https://github.com/stegu/webgl-noise)
- [GitHub - stegu/psrdnoise](https://github.com/stegu/psrdnoise/)
- [LICENSE - ashima/webgl-noise](https://github.com/ashima/webgl-noise/blob/master/LICENSE)
- [LICENSE - stegu/webgl-noise](https://github.com/stegu/webgl-noise/blob/master/LICENSE)
- [LICENSE - stegu/psrdnoise](https://github.com/stegu/psrdnoise#license)

[npm]: https://img.shields.io/npm/v/shadox
[npm-url]: https://www.npmjs.com/package/shadox
