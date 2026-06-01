//Get Position
var _x = x + sineX + showX;
var _y = y + sineY + showY;

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, _x+shadowX, _y+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);

//Draw Self
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);