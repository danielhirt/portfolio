#version 300 es
precision highp float;

uniform vec2 uResolution;
uniform float uTime;
uniform vec2 uMouse;
uniform vec2 uClickPos[10];
uniform float uClickTimes[10];
uniform vec3 uInkColor;
uniform vec3 uBgColor;
uniform vec3 uAccentColor;
uniform float uPixelSize;

out vec4 fragColor;

// --- Bayer dithering ---
float Bayer2(vec2 a) {
  a = floor(a);
  return fract(a.x / 2.0 + a.y * a.y * 0.75);
}

float Bayer4(vec2 a)  { return Bayer2(0.5 * a) * 0.25 + Bayer2(a); }
float Bayer8(vec2 a)  { return Bayer4(0.5 * a) * 0.25 + Bayer2(a); }

// --- Hash / noise ---
float hash(vec2 p) {
  vec3 p3 = fract(vec3(p.xyx) * 0.1031);
  p3 += dot(p3, p3.yzx + 33.33);
  return fract((p3.x + p3.y) * p3.z);
}

float noise(vec2 p) {
  vec2 i = floor(p);
  vec2 f = fract(p);
  f = f * f * (3.0 - 2.0 * f); // smoothstep
  return mix(
    mix(hash(i), hash(i + vec2(1.0, 0.0)), f.x),
    mix(hash(i + vec2(0.0, 1.0)), hash(i + vec2(1.0, 1.0)), f.x),
    f.y
  );
}

// --- FBM (5 octaves) ---
float fbm(vec2 p) {
  float v = 0.0;
  float a = 0.5;
  vec2 shift = vec2(100.0);
  mat2 rot = mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.5));
  for (int i = 0; i < 5; i++) {
    v += a * noise(p);
    p = rot * p * 2.0 + shift;
    a *= 0.5;
  }
  return v;
}

void main() {
  vec2 uv = gl_FragCoord.xy;
  vec2 cellCoord = floor(uv / uPixelSize);
  vec2 cellUV = fract(uv / uPixelSize);

  // FBM-based organic wave pattern
  vec2 fbmInput = cellCoord * 0.02;
  float t = uTime * 0.15;
  float wave = fbm(fbmInput + vec2(t, t * 0.7));
  wave = wave * 0.55 + 0.1; // remap: subtle base brightness

  // Mouse glow — increase brightness near cursor
  float mouseDist = length(uv - uMouse);
  float glow = exp(-mouseDist * mouseDist / (180.0 * 180.0));
  wave += glow * 0.35;

  // Click ripples (tracked separately for accent tinting)
  float ripple = 0.0;
  for (int i = 0; i < 10; i++) {
    if (uClickTimes[i] > 0.0) {
      float age = uTime - uClickTimes[i];
      if (age < 3.0) {
        float dist = length(uv - uClickPos[i]);
        float r = age * 350.0;
        float ring = exp(-pow(dist - r, 2.0) / (60.0 * 60.0));
        float decay = exp(-age * 1.5);
        ripple += ring * decay * 0.4;
      }
    }
  }

  float totalWave = clamp(wave + ripple, 0.0, 1.0);

  // Bayer threshold
  float threshold = Bayer8(cellCoord) * 0.98 + 0.01;

  // Square mask within cell
  float sq = max(abs(cellUV.x - 0.5), abs(cellUV.y - 0.5));
  float radius = 0.48;
  float dot = step(sq, radius);

  // Tint dots toward accent color based on ripple intensity
  float show = step(threshold, totalWave) * dot;
  float rippleStrength = clamp(ripple * 2.5, 0.0, 1.0);
  vec3 dotColor = mix(uInkColor, uAccentColor, rippleStrength);
  vec3 color = mix(uBgColor, dotColor, show);

  fragColor = vec4(color, 1.0);
}
