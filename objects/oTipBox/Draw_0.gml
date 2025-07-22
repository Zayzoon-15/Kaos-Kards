//Varss
var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;
var _Boxy1, _Boxy2, _textY;

//Position
if top
{
    _Boxy1 = y-height-(heightMargin*2);
    _Boxy2 = y;
    _textY = y-height-heightMargin;
} else {
    _Boxy1 = y;
    _Boxy2 = y+height+(heightMargin*2);
    _textY = y+heightMargin;
}

//Draw The Box
drawRectOutlined(x-_halfWidth-widthMargin,_Boxy1,x+_halfWidth+widthMargin,_Boxy2,_rectRound,c_black,c_white,UIBOX_ALPHA*textAlpha,1*textAlpha);

//Draw Text
setupText(fnMain,fa_center,fa_top,c_white,textAlpha);
draw_text_ext_transformed(x,_textY,text,-1,maxWidth,size,size,0);

//Reset
resetDraw();
