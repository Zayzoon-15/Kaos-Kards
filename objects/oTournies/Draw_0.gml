//Draw Shadow
draw_sprite_ext(sprite_index,image_index,x,y+shadowY,xscale-.05,yscale-.05,image_angle,c_black,image_alpha*SHADOW_ALPHA);

//Draw Self
draw_sprite_ext(sprite_index,image_index,x,y + boxY,xscale,yscale,image_angle,image_blend,image_alpha);
