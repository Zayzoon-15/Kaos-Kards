//Draw The Box
var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;
drawRectOutlined(x-_halfWidth-widthMargin,y-height-(heightMargin*2),x+_halfWidth+widthMargin,y,_rectRound,1,c_black,c_white,UIBOX_ALPHA*textAlpha,1*textAlpha);

//Get Text
var _text = string_replace(text,textSmall,"");
var _textSmall = string_replace(textSmall,_text,"");

//Draw Text
textSetup(fnMain,fa_center,fa_top,c_white,textAlpha);
draw_text_ext_transformed(x,y-height-heightMargin-(heightMargin/2),name,-1,maxWidth,2,2,0);
draw_text_ext_transformed(x,y-height-heightMargin,_text,-1,maxWidth,1,1,0);

draw_set_colour(c_ltgrey);
draw_text_ext_transformed(x,y-string_height_ext(_textSmall,-1,maxWidth)-heightMargin,_textSmall,-1,maxWidth,1,1,0); //Small stuff like "(2 Uses Left)"

//Reset
drawReset();
