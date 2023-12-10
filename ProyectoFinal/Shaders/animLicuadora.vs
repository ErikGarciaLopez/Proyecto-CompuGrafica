#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

const float amplitude = 0.01;
const float frequency = 0.01;
const float lateralAttenuation = 0.2;
const float PI = 3.14159;

out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float time;

void main()
{
  float distance = length(aPos);
  float effect = amplitude * sin(PI * distance * frequency + time);
  float lateralEffect = effect * lateralAttenuation;
  gl_Position = projection * view * model * vec4(aPos.x + lateralEffect, aPos.y, aPos.z + lateralEffect, 1);
  TexCoords = vec2(aTexCoords.x + lateralEffect, aTexCoords.y + lateralEffect);
}

	