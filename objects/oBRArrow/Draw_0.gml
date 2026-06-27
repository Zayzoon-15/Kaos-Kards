//Draw Shadow
draw_sprite_ext(sprite_index,image_index,x+shadowX,y+shadowY,shadowScale,shadowScale,angle,c_black,image_alpha * SHADOW_ALPHA_BREAK_ROOM);

#region White Outline

//Set Outline
outlineSetup(6.0,c_white,outlineAlpha);

//Draw Sprite
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,angle,image_blend,image_alpha);

//Quick Reset
drawReset();


#endregion

#region Black Outline

//Set Outline
outlineSetup(4.0,c_black,outlineAlpha);

//Draw Sprite
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,angle,image_blend,image_alpha);

//Quick Reset
drawReset();


#endregion

//Draw Door
draw_sprite(sBRDoor,0,SCREEN_EDGE.left,0);