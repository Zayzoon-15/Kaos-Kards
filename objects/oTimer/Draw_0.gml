//Draw Gato
draw_self();

//Get Time
var _mins = global.gameTimer div 60;
var _secs = global.gameTimer mod 60;

//Add Zeros If Time Too Short
if _mins < 10 then _mins = $"0{_mins}";
if _secs < 10 then _secs = $"0{_secs}";

//Setup Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var _text = $"{_mins}:{_secs}";
var _maxWidth = 300;
var _height = string_height_ext("00:00",-1,_maxWidth);
var _width = string_width_ext("00:00",-1,_maxWidth);

//Setup Box
var _halfWidth = _width/2;
var _rectRound = UIBOX_RAD;
var _heightMargin = 2;
var _widthMargin = 10;
var _x = x;
var _y = bbox_bottom + 15;

//Draw The Box
drawRectOutlined(_x-_halfWidth-_widthMargin,_y-_height-(_heightMargin*2),_x+_halfWidth+_widthMargin,_y,_rectRound,1,c_black,c_white,UIBOX_ALPHA*image_alpha,1*image_alpha);

//Draw Text
draw_text_ext_transformed(_x,_y-_height-(_heightMargin/2),_text,-1,_maxWidth,1,1,0);