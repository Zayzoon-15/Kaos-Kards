var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;

//Draw The Box
drawRectOutlined(x-_halfWidth-widthMargin,y-height-(heightMargin*2),x+_halfWidth+widthMargin,y,_rectRound);

//Draw Text
textSetup(fnMain,fa_center,fa_top,c_white,1);
draw_text_ext_transformed(x,y-height-heightMargin,text,-1,maxWidth,1,1,0);

//Reset
drawReset();