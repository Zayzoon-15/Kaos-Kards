//Setup
textSetup(fnMain,fa_center,fa_top);
var _margin = new Vector2(20,10);
var _maxWidth = 230;
var _textH = textInfo.h;
var _nameH = string_height_ext(name,-1,_maxWidth/2)*2;
var _totalH = _textH + _nameH;

if !flipInfo
{
    //Draw Rectangle
    drawRectOutlined((x-_maxWidth/2)-_margin.x, y-_totalH-_margin.y-10, (x+_maxWidth/2)+_margin.x, y+_margin.y, 10,1,c_black,c_white,UIBOX_ALPHA*textAlpha,textAlpha);
    
    //Draw Text
    draw_set_alpha(textAlpha);
    draw_text_ext_transformed(x,y-_totalH-10,name,-1,_maxWidth/2,2,2,0);
    draw_set_halign(fa_left);
    textInfo = drawTextTagged(x, y-_textH, text, _maxWidth,boxColor);
} else {
    
    //Draw Rectangle
    drawRectOutlined((x-_maxWidth/2)-_margin.x, y-_margin.y, (x+_maxWidth/2)+_margin.x, y+_totalH+_margin.y+10, 10,1,c_black,c_white,UIBOX_ALPHA*textAlpha,textAlpha);
    
    //Draw Text
    draw_set_alpha(textAlpha);
    draw_text_ext_transformed(x,y,name,-1,_maxWidth/2,2,2,0);
    draw_set_halign(fa_left);
    textInfo = drawTextTagged(x, y+_margin.y+_nameH, text, _maxWidth,boxColor);
}



//Reset Draw
drawReset();