# Shadox

[![NPM Package][npm]][npm-url]

Shader tools.

## Usage

### CDN

```js
import * as Shadox from "https://cdn.jsdelivr.net/npm/shadox@0.2.0/src/Shadox.js"

const frag = `#version 300 es
  precision mediump float;

  uniform vec2 iResolution;
  // ...

  ${Shadox.noiseMath} // before any noise function
  ${Shadox.snoise3D}
  ${Shadox.snoise3DImage}
  ${Shadox.displace}
  ${Shadox.gradient}
  ${Shadox.zcPalette(5)}
  ${Shadox.iqPalette}
  ${Shadox.extend}
  ${Shadox.unsharp}
  ${Shadox.blur(30)}
  ${Shadox.smooth}
  ${Shadox.mapFunc}

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

Please refer to [the MIT license](https://github.com/ZRNOF/Shadox/blob/main/LICENSE) for detailed licensing information.

[npm]: https://img.shields.io/npm/v/shadox
[npm-url]: https://www.npmjs.com/package/shadox
