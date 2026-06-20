#region Draw Typing

//Text Setup
textSetup(fnMain,fa_center,fa_middle);
var _x = ROOM_CENTER.x;
var _y = SCREEN_HEIGHT - 100;

//Color
var _boxOutline = typing ? 1 : 0;

//Text Stuff
var _boxText = currentText == "" ? "A" : currentText;
var _w = string_width(_boxText)*2;
var _h = string_height(_boxText)*2;
var _boxMargin = 20;

//Box Stuff
var _halfWidth = _w/2;
var _rectRound = UIBOX_RAD;

//Draw The Box
drawRectOutlined(_x-_halfWidth-_boxMargin,_y-_h-(_boxMargin*2),_x+_halfWidth+_boxMargin,_y-_h,_rectRound,2,c_black,c_white,UIBOX_ALPHA,_boxOutline);

//Draw Text
draw_text_transformed(_x,_y-_h-_boxMargin,currentText,2,2,0);

drawReset();

#endregion

#region Draw Typing Enemy

//Text Setup
textSetup(fnMain,fa_center,fa_middle);
var _x = ROOM_CENTER.x;
var _y = SCREEN_HEIGHT - 40;

//Color
var _boxOutline = typingEnemy ? 1 : 0;

//Text Stuff
var _boxText = enemyCurrentText == "" ? "A" : enemyCurrentText;
var _w = string_width(_boxText)*2;
var _h = string_height(_boxText)*2;
var _boxMargin = 20;

//Box Stuff
var _halfWidth = _w/2;
var _rectRound = UIBOX_RAD;

//Draw The Box
drawRectOutlined(_x-_halfWidth-_boxMargin,_y-_h-(_boxMargin*2),_x+_halfWidth+_boxMargin,_y-_h,_rectRound,2,c_black,c_white,UIBOX_ALPHA,_boxOutline);

//Draw Text
draw_text_transformed(_x,_y-_h-_boxMargin,enemyCurrentText,2,2,0);

drawReset();

#endregion

draw_self();

//Text Setup
textSetup(fnMain,fa_center,fa_bottom);
draw_text_transformed(x,bbox_top-50,info.name,2,2,0);