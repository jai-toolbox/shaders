#version 330 core
layout (location = 0) in vec3 xyz_position;
uniform mat4 world_to_camera;
uniform mat4 camera_to_clip;

void main() {
    gl_Position = camera_to_clip * world_to_camera * vec4(xyz_position, 1.0);
}
