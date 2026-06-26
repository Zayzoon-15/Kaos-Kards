//Draw Shadow
draw_sprite_ext(sprite_index,image_index,x+shadowX,y+shadowY,shadowScale,shadowScale,angle,c_black,image_alpha * SHADOW_ALPHA_BREAK_ROOM);

//Set Outline
setupOutline(2.0,c_white,outlineAlpha);

//Set Outline
//setupOutline(2.0,c_black,outlineAlpha);

//Draw Sprite
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,angle,image_blend,image_alpha);

drawReset();

//Draw Door
draw_sprite(sBRDoor,0,SCREEN_EDGE.left,0);