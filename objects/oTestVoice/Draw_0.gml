//Text Setup
textSetup(fnMain,fa_center,fa_middle);

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
drawRectOutlined(x-_halfWidth-_boxMargin,y-_h-(_boxMargin*2),x+_halfWidth+_boxMargin,y-_h,_rectRound,2,c_black,c_white,UIBOX_ALPHA,_boxOutline);

//Draw Text
draw_text_transformed(x,y-_h-_boxMargin,currentText,2,2,0);


#region Draw Controls

textSetup(fnMain,fa_left,fa_bottom);
var _margin = 10;
var _text = "Space To Start Typing\nEnter To Confirm\nCtrl + Backspace To Clear Text\nBackspace To Remove Characters";

draw_text_transformed(_margin,SCREEN_HEIGHT-_margin,_text,2,2,0);

#endregion

drawReset();