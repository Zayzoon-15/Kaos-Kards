//Setup Text
draw_set_font(fnNumber);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Set String
var _string;
var _value = round(value);
if add
{
    _string = $"+{_value}";
} else _string = $"-{_value}";

//Draw Shadow
var _shadowX = (x - (room_width/2))*.03;
_shadowX = clamp(_shadowX,-5,5);
draw_set_color(c_black);
draw_set_alpha(.7*image_alpha);
draw_text_transformed(x+_shadowX,y+2,_string,scale-.1,scale-.1,0);

//Draw Text
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_text_transformed(x,y,_string,scale,scale,0);

//Reset Alpha
draw_set_alpha(1);