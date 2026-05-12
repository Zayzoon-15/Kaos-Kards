//Vars
var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;

//Position
var _boxX1 = x-_halfWidth-widthMargin;
var _boxY1 = top ? y-height-(heightMargin*2) : y;
var _boxX2 = x+_halfWidth+widthMargin;
var _boxY2 = top ? y : y+height+(heightMargin*2);
var _textY = top ? y-height-heightMargin : y+heightMargin;


//Draw The Box
drawRectOutlined(_boxX1,_boxY1,_boxX2,_boxY2,_rectRound,1,c_black,c_white,UIBOX_ALPHA*textAlpha,1*textAlpha);

//Draw Text
textSetup(fnMain,fa_center,fa_top,c_white,textAlpha);
draw_text_ext_transformed(x,_textY,text,-1,maxWidth,size,size,0);

//Reset
drawReset();

