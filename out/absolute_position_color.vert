#version 330 core

in vec3 position;

in vec3 passthrough_rgb_color;
out vec3 rgb_color;

void main() {
   rgb_color = passthrough_rgb_color;
   gl_Position = vec4(position.x, position.y, position.z, 1.0);
}
