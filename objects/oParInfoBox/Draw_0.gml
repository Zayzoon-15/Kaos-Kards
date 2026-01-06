//Box Stuff
var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;

//Draw The Box
drawRectOutlined(x-_halfWidth-widthMargin,y-height-(heightMargin*2),x+_halfWidth+widthMargin,y,_rectRound,outlineWidth,c_black,c_white,UIBOX_ALPHA*alpha,1*alpha);

//Draw Text
textSetup(targetFont,fa_center,fa_top,c_white,alpha);
gpu_set_tex_filter(smoothText);
draw_text_ext_transformed(x,y-height-heightMargin,text,-1,maxWidth/textScale,textScale,textScale,0);

//Reset
drawReset();