
//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+shadowX, y+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, .7);

//Draw Self
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);