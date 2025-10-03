var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;

//Draw The Box
drawRectOutlined(x-_halfWidth-widthMargin,y-height-(heightMargin*2),x+_halfWidth+widthMargin,y,_rectRound,1,c_black,c_white,UIBOX_ALPHA*textAlpha,1*textAlpha);

//Draw Text
setupText(fnMain,fa_center,fa_top,c_white,textAlpha);
draw_text_ext_transformed(x,y-height-heightMargin-(heightMargin/2),name,-1,maxWidth,2,2,0);
draw_text_ext_transformed(x,y-height-heightMargin,text,-1,maxWidth,1,1,0);

//Reset
resetDraw();
