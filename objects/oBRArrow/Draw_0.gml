//Draw Shadow
draw_sprite_ext(sprite_index,image_index,x,y+7,image_xscale,image_yscale,image_angle,c_black,image_alpha * SHADOW_ALPHA_BREAK_ROOM);

//Draw Sprite
draw_self();

//Draw Door
draw_sprite(sBRDoor,0,SCREEN_EDGE.left,0);