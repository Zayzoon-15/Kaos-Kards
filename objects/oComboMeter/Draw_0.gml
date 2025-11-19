//Draw Meter
draw_self();

//Draw Arrow
draw_sprite_ext(sComboArrow,0,x,y,image_xscale,image_yscale,90-arrowDir,image_blend,image_alpha);
draw_sprite_ext(sComboArrow,1,x,y,image_xscale,image_yscale,0,image_blend,image_alpha);