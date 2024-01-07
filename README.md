# Shox

[![NPM Package][npm]][npm-url]

Shader tools.

## Usage

### CDN

```js
import * as Shox from "https://cdn.jsdelivr.net/npm/shox@1.0.0/src/Shox.js"

const frag = `#version 300 es
  precision mediump float;

  uniform vec2 iResolution;
  // ...

  ${Shox.noiseMath} // before any noise function
  ${Shox.snoise3D}
  ${Shox.snoise3DImage}
  ${Shox.displace}
  ${Shox.extend}
  ${Shox.flip}
  ${Shox.pixelate}
  ${Shox.hash}
  ${Shox.voronoi}
  ${Shox.gradient}
  ${Shox.zcPalette(5)}
  ${Shox.iqPalette}
  ${Shox.unsharp}
  ${Shox.blur(30)}
  ${Shox.mapFunc}
  ${Shox.smooth}

  void main() {
    // ...
  }
`
```

### NPM

```bash
npm i shox
```

## LICENSE

### MIT license

Please refer to [the MIT license](https://github.com/ZRNOF/Shox/blob/main/LICENSE) for detailed licensing information.

[npm]: https://img.shields.io/npm/v/shox
[npm-url]: https://www.npmjs.com/package/shox
