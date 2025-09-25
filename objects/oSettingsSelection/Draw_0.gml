
//Draw Self
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*boxXScale,image_yscale*boxYScale,image_angle,image_blend,image_alpha);

//Draw Text
setupText(fnMain,fa_center,fa_middle,c_white,image_alpha);
draw_text_transformed(x,bbox_top-20,$"{text}:",textSize*image_xscale,textSize*image_yscale,0);
draw_text_transformed(x,y,currentSelection.text,textSize*image_xscale*boxXScale,textSize*image_yscale*boxYScale,0);


