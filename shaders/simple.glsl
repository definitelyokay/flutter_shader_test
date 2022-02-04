#version 320 es

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Adapted from https://www.shadertoy.com/view/Xd3BWr

precision highp float;

layout(location = 0) out vec4 fragColor;

// Pass in our time, width, and height as uniforms.
layout(location = 0) uniform float iTime;
layout(location = 1) uniform float width;
layout(location = 2) uniform float height;

// void main() {
//     fragColor = vec4(0.0, a, 0.0, 1.0);
// }

void main() 
{
    // This is how you get the pixel's location.
    vec2 fragCoord = gl_FragCoord.xy;

    // Mimic shadertoy's iResolution variable (sorta).
    vec2 iResolution = vec2(width, height);

    vec2 uv = fragCoord / iResolution;

    float c = uv.x * 2.0 + iTime*2.0;
    c = mod(c, 1.0);
    c = step(c, 0.5);

    fragColor = vec4(c);
}
