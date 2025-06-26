
//Set Alpha
draw_set_alpha(image_alpha);

//Setup Text
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw Text
draw_text_transformed(x,y,number,image_xscale,image_yscale,image_angle);

//Reset Alpha
draw_set_alpha(1);