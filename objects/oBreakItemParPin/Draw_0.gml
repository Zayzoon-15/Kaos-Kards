//Draw Shadow
draw_sprite_ext(sprite_index,0,x+shadowOffset.x,y+shadowOffset.y,image_xscale-shadowSize,image_yscale-shadowSize,image_angle,c_black,SHADOW_ALPHA_BREAK_ROOM*image_alpha);

//Draw Self
draw_self();

//Draw Pin
draw_sprite(sprite_index,1,x,y);