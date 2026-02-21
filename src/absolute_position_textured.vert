#version 330 core

in vec3 position;
in vec2 passthrough_texture_coordinate;

out vec2 texture_coordinate;

#include "aspect_ratio_correction.glsl"

void main() {
    texture_coordinate = passthrough_texture_coordinate;
    gl_Position = vec4(scale_position_by_aspect_ratio(position, aspect_ratio), 1.0f);
}
