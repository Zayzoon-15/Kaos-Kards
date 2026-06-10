//Draw Shadow
var _x = x-3;
var _y = ystart - sprite_yoffset + sprite_height-4;
var _scale = 1 - (ystart - y)*.005;
draw_sprite_pos_ext(sprite_index,1,_x,_y,sprite_width,sprite_height,sprite_xoffset,sprite_height,_scale,_scale,30,70,-3,SHADOW_ALPHA_BREAK_ROOM);


//Draw Self
draw_self();