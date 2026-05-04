//Text
textSetup(fnMain,fa_center,fa_top);
var _title = "Tournament Rules";
var _info = "";
var _titleScale = 3;
var _infoScale = 2;
var _maxW = 700;

//Set Info
if !array_is_empty(rules)
{
    for (var i = 0; i < array_length(rules); i++) {
        
        var _desc = is_method(rules[i].desc) ? rules[i].desc() : rules[i].desc;
    	_info += $"\n- {_desc}";
    }
} else _info = "\nThere are no rules set";
_info += "\n\nClick anywhere to close";

//Position
var _x = ROOM_CENTER.x;
var _y = ROOM_CENTER.y;
var _w = _maxW+50;
var _h = string_height_ext(_info,-1,_maxW)*_infoScale + string_height_ext(_title,-1,_maxW)*_titleScale + 10*_infoScale;

//Draw Bg
drawRectOutlined(_x-_w/2,_y-_h/2,_x+_w/2,_y+_h/2,UIBOX_RAD,5,c_black,c_white,.9,1);

//Draw Title
draw_text_ext_transformed(_x,(_y-_h/2)+5*_infoScale,_title,1,_maxW,_titleScale,_titleScale,0);

//Draw Info
draw_set_valign(fa_bottom);
draw_text_ext_transformed(_x,(_y+_h/2)-5*_infoScale,_info,-1,_maxW,_infoScale,_infoScale,0);

//Reset
drawReset();