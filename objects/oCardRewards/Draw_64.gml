
//Draw Bg
draw_set_color(c_black);
draw_set_alpha(.7*image_alpha);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);

//Draw Flash
var _flashX = display_get_gui_width()/2;
var _flashY = display_get_gui_height()/2;
image_angle -= .5;
draw_sprite_ext(sFlash,0,_flashX,_flashY,image_xscale+1.5,image_yscale+1.5,image_angle,c_white,image_alpha);

//Draw Text
var _text;
if arraySize == 1
{
    _text = "You Got A New Card!";
} else _text = "You Got Some New Cards!";
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_set_alpha(image_alpha*.7);
draw_text_transformed(_flashX,58,_text,image_xscale+1.9,image_yscale+1.9,0);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_text_transformed(_flashX,50,_text,image_xscale+2,image_yscale+2,0);

draw_set_color(c_black);
draw_set_alpha(.7*image_alpha);
draw_text_transformed(_flashX,display_get_gui_height()-50+5,"Click Anywhere To Continue",image_xscale+.9,image_yscale+.9,0);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_text_transformed(_flashX,display_get_gui_height()-50,"Click Anywhere To Continue",image_xscale+1,image_yscale+1,0);


//Reset
draw_set_color(c_white);
draw_set_alpha(1);