//Set Scissor
var _scissor = gpu_get_scissor();

var _struct = {
    x : (SCREEN_WIDTH/2) - oDBInsertHole.bbox_left-514,
    y : oDBInsertHole.bbox_top,
    w : 300,
    h : 500,
}

if room == rDeckBuilder2
{
    _struct.x = (SCREEN_WIDTH/2) - (oDBInsertHole.bbox_left-190)+1182//(SCREEN_WIDTH/2) - (oDBInsertHole.bbox_left-300)+514
}

gpu_set_scissor(_struct);

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+shadowX, y+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);

//Draw Card
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);


gpu_set_scissor(_scissor);