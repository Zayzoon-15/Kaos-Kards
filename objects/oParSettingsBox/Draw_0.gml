
//Set Alpha Based On Disabled
var _alpha = 1;
if disabled then _alpha = .5;

//Draw Bg
var _bgColor = merge_color(c_black,c_gray,rectAlpha);
drawRectOutlined(rectX1,rectY1,rectX2,rectY2,UIBOX_RAD,2,_bgColor,c_white,.5*_alpha,_alpha);

//Draw Name
textSetup(fnMain,fa_left,fa_middle,c_white,_alpha);
draw_text_transformed(rectX1+width,y,text,2*image_xscale,2*image_yscale,0);

//Draw Reason
if disabled
{
	textSetup(fnMain,fa_center,fa_middle);
	draw_text_transformed(x,y,reason,2*image_xscale,2*image_yscale,0);
}

//Reset Draw
drawReset();