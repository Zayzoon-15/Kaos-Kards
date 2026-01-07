//Inherit
event_inherited();

//Button Action
btnAction = function()
{
    //Get Text Size
    var _text = $" < {choices[curOption]} > ";
    var _width = string_width(_text)*textTargetScale;
    var _center = (rectX1-20)-_width/2;
    
    //Get Mouse Position
    var _dir = mouse_x > _center ? 1 : -1;
    
    //Change Option
    curOption += _dir;
    
    //Loop Option
    if curOption >= array_length(choices) then curOption = 0;
    if curOption < 0 then curOption = array_length(choices)-1;
}

/// @desc Draws The Button And Other Stuff
drawBtn = function()
{
    //Draws Box And Text
    drawBox();
    
    //Set Alpha Based On Disabled
    var _alpha = 1;
    if disabled then _alpha = .5;
    
    //Draw Option
    var _text = $" < {choices[curOption]} > ";
    textSetup(fnMain,fa_right,fa_middle,c_white,_alpha);
    draw_text_transformed(rectX1 - 20,y,_text,textScaleX,textScaleY,0);
}