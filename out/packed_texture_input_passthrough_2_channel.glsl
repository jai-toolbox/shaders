// I guess in the future we could do an array, but I'm just being explicit and boring until I see this working.
// for 4 or 8 channel I'll definitely move to that approach

in int passthrough_packed_texture_index_0;
in vec2 passthrough_texture_coordinate_0;
in int passthrough_packed_texture_bounding_box_index_0;

in int passthrough_packed_texture_index_1;
in vec2 passthrough_texture_coordinate_1;
in int passthrough_packed_texture_bounding_box_index_1;

out vec2 texture_coordinate_0;
// flat means that the rasterizer will not interpolate this
flat out int packed_texture_index_0;
flat out int packed_texture_bounding_box_index_0;

out vec2 texture_coordinate_1;
// flat means that the rasterizer will not interpolate this
flat out int packed_texture_index_1;
flat out int packed_texture_bounding_box_index_1;

void packed_texture_passthrough(

        in vec2 passthrough_texture_coordinate_0, 
        in int passthrough_packed_texture_index_0, 
        in int passthrough_packed_texture_bounding_box_index_0, 

        out vec2 texture_coordinate_0, 
        out int packed_texture_index_0, 
        out int packed_texture_bounding_box_index_0,

        in vec2 passthrough_texture_coordinate_1, 
        in int passthrough_packed_texture_index_1, 
        in int passthrough_packed_texture_bounding_box_index_1, 

        out vec2 texture_coordinate_1, 
        out int packed_texture_index_1, 
        out int packed_texture_bounding_box_index_1


    ) {

    texture_coordinate_0 = passthrough_texture_coordinate_0;
    packed_texture_index_0 = passthrough_packed_texture_index_0;
    packed_texture_bounding_box_index_0 = passthrough_packed_texture_bounding_box_index_0;

    texture_coordinate_1 = passthrough_texture_coordinate_1;
    packed_texture_index_1 = passthrough_packed_texture_index_1;
    packed_texture_bounding_box_index_1 = passthrough_packed_texture_bounding_box_index_1;

}
