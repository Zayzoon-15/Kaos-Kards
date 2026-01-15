//Depth
depth = -5;

//Get Text Size
draw_set_font(targetFont);
height = string_height_ext(text,-1,maxWidth/textScale)*textScale;
width = string_width_ext(text,-1,maxWidth/textScale)*textScale;

//Draw The Box
drawRectOutlined(x-(width/2)-widthMargin,y-height-(heightMargin*2),x+(width/2)+widthMargin,y,boxRad,outlineWidth,c_black,c_white,boxAlpha*alpha,alpha);

//Draw Text
textSetup(targetFont,fa_center,fa_top,c_white,alpha);
gpu_set_tex_filter(smoothText);
draw_text_ext_transformed(x,y-height-heightMargin,text,-1,maxWidth/textScale,textScale,textScale,0);

//Reset
drawReset();