// SPDX-License-Identifier: Unlicense

// degree 3
float smoo3(float x) { return x*x*(3.-2.*x); }
vec2 smoo3(vec2 x) { return x*x*(3.-2.*x); }
vec3 smoo3(vec3 x) { return x*x*(3.-2.*x); }
vec4 smoo3(vec4 x) { return x*x*(3.-2.*x); }

// degree 5
float smoo5(float x) { return x*x*x*(x*(6.*x-15.)+10.); }
vec2 smoo5(vec2 x) { return x*x*x*(x*(6.*x-15.)+10.); }
vec3 smoo5(vec3 x) { return x*x*x*(x*(6.*x-15.)+10.); }
vec4 smoo5(vec4 x) { return x*x*x*(x*(6.*x-15.)+10.); }

// degree 7
float smoo7(float x) { return x*x*x*x*(x*(x*(-20.*x+70.)-84.)+35.); }
vec2 smoo7(vec2 x) { return x*x*x*x*(x*(x*(-20.*x+70.)-84.)+35.); }
vec3 smoo7(vec3 x) { return x*x*x*x*(x*(x*(-20.*x+70.)-84.)+35.); }
vec4 smoo7(vec4 x) { return x*x*x*x*(x*(x*(-20.*x+70.)-84.)+35.); }
