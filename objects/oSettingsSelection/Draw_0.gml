
//Draw Self
draw_self();

//Draw Text
setupText(fnMain,fa_center,fa_middle,c_white,image_alpha);
draw_text_transformed(x,bbox_top-20,text,textSize*image_xscale,textSize*image_yscale,0);
draw_text_transformed(x,y,currentSelection.text,textSize*image_xscale,textSize*image_yscale,0);


