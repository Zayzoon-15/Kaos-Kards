draw_set_alpha(alpha);

//Draw Text
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnMain);

var _x = display_get_gui_width()/2;
var _y = 30;

if xOveride != undefined
{
    _x = xOveride;
}

if yOveride != undefined
{
    draw_set_valign(fa_middle);
    _y = yOveride;
}



randomize();
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;


draw_text_transformed(_x+_shakeX,_y+_shakeY,text,2,2,0);

draw_set_alpha(1);
