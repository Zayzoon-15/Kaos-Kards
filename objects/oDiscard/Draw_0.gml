draw_self();

#region Draw Stats

//Setup Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var _text = $"{discards}/{global.maxDiscards}";
height = string_height_ext(_text,-1,maxWidth);
width = string_width_ext(_text,-1,maxWidth);

//Setup Box
var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;
var _x = x;
var _y = y - (sprite_width/2) - 10;

//Draw The Box
drawRectOutlined(_x-_halfWidth-widthMargin,_y-height-(heightMargin*2),_x+_halfWidth+widthMargin,_y,_rectRound,1,c_black,c_white,UIBOX_ALPHA*boxAlpha,1*boxAlpha);

//Draw Text
setupText(fnMain,fa_center,fa_top,c_white,boxAlpha);
draw_text_ext_transformed(_x,_y-height-(heightMargin/2),_text,-1,maxWidth,1,1,0);

//Reset Draw
resetDraw();


#endregion