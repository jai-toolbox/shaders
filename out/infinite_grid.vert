#version 330

// This shader has no vertex inputs, the grid quad geometry is
// stored entirely as constants. We use gl_VertexID to index into
// the vertex/index arrays, so you just need to issue a draw call
// with 6 vertices and an empty VAO bound.

out vec3 grid_world_position;

uniform mat4 camera_to_clip = mat4(1.0);
uniform mat4 world_to_camera = mat4(1.0);

uniform float grid_size = 100.0;  // note that this is also in the fragment shader
uniform vec3 camera_position;

const vec3 square_positions[4] = vec3[4](
    vec3(-1.0, 0.0, -1.0),      // bottom left
    vec3( 1.0, 0.0, -1.0),      // bottom right
    vec3( 1.0, 0.0,  1.0),      // top right
    vec3(-1.0, 0.0,  1.0)       // top left
);

const int square_indices[6] = int[6](0, 2, 1, 2, 0, 3);

void main() {
    // look up the vertex position from the hardcoded quad.
    // the unit square [-1, 1] is scaled by grid_size to cover
    // the desired world-space area.

    int index = square_indices[gl_VertexID];
    vec3 grid_position = square_positions[index] * grid_size;

    // move the grid to the camera's XZ position so the grid
    // always surrounds the viewer. The Y stays at 0 (ground plane).
    // This is what makes the grid appear "infinite" — it follows
    // the camera so you never see its edges.

    grid_position.x += camera_position.x;
    grid_position.z += camera_position.z;

    // we pass the world position to the fragment shader so it can
    // compute grid lines based on world-space coordinates.
    grid_world_position = grid_position;

    gl_Position = camera_to_clip * world_to_camera * vec4(grid_position, 1.0);
}
