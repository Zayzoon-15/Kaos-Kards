//Draw Bg
draw_set_color(c_black);
draw_set_alpha(.7*image_alpha);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);

//Draw Flash
var _flashX = display_get_gui_width()/2;
var _flashY = display_get_gui_height()/2;
image_angle -= .5;
draw_sprite_ext(sFlash,0,_flashX,_flashY,image_xscale+1.5,image_yscale+1.5,image_angle,c_white,image_alpha);

//Draw Sprite
var _winX = display_get_gui_width()/2;
var _winY = display_get_gui_height()/2;
draw_sprite_ext(sWin,0,_winX,_winY+10,image_xscale+.4,image_yscale+.4,0,c_black,image_alpha*.7);
draw_sprite_ext(sWin,0,_winX,_winY,image_xscale+.5,image_yscale+.5,0,c_white,image_alpha);

//Draw Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _x = display_get_gui_width()/2;

draw_set_color(c_black);
draw_set_alpha(.7*image_alpha);
draw_text_transformed(_x,78,"You Beat Everyone!!!\nWay To Go!!!",image_xscale+1.9,image_yscale+1.9,0);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_text_transformed(_x,70,"You Beat Everyone!!!\nWay To Go!!!",image_xscale+2,image_yscale+2,0);

draw_set_color(c_black);
draw_set_alpha(.7*image_alpha);
draw_text_transformed(_x,display_get_gui_height()-50+5,"Click Anywhere To Continue",image_xscale+.9,image_yscale+.9,0);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_text_transformed(_x,display_get_gui_height()-50,"Click Anywhere To Continue",image_xscale+1,image_yscale+1,0);

//Reset
draw_set_color(c_white);
draw_set_alpha(1);