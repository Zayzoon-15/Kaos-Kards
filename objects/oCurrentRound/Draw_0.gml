//Draw Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnMain);

var _x = display_get_gui_width()/2;
var _y = 35;

drawBox(_x,_y,70,20);

draw_text_transformed(_x,_y,$"Round: {currentRound}",2,2,0);