
//Setup
setupText(fnNumberOutline,fa_center,fa_middle,c_white,image_alpha);

//Get String
var _string;
if value >= 0
{
    _string = $"+{value}";
} else _string = value;

//Draw Text
draw_text_transformed(x,y,_string,image_xscale,image_yscale,image_angle);

//Reset
resetDraw();
