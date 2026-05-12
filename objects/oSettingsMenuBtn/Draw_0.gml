//Draw Self
draw_sprite_ext(sprite_index,image_index,boxX,boxY,xscale,yscale,image_angle,image_blend,image_alpha);

//Draw Text
textSetup(fnMain,fa_center,fa_middle,c_white,image_alpha);
draw_text_transformed(boxX,boxY,targetMenu,textSize*xscale,textSize*yscale,0);

//Draw Self
draw_sprite_ext(sprite_index,image_index,boxX,boxY,xscale,yscale,image_angle,c_black,boxAlpha);

//Reset
drawReset();