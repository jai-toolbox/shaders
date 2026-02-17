in uint local_to_world_index;

layout(std140) uniform LtwMatrices {
    mat4 local_to_world_matrices[1024];
};
