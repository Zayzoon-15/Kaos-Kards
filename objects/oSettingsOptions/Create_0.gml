//Inherit
event_inherited();

//Set Current Option
if targetOption != undefined
{
    if variable_global_exists(targetOption)
    {
        curOption = variable_global_get(targetOption);
    } else curOption = targetOption;
}

//Button Action
btnAction = function()
{
    //Get Text Size
    var _text = $" < {choices[curOption].text} > ";
    var _width = string_width(_text)*textTargetScale;
    var _center = (rectX1-20)-_width/2;
    
    //Get Mouse Position
    var _dir = mouse_x > _center ? 1 : -1;
    
    //Change Option
    curOption += flipChoices ? -_dir : _dir;
    
    //Loop Option
    if curOption >= array_length(choices) then curOption = 0;
    if curOption < 0 then curOption = array_length(choices)-1;
    
    //Set Current Option If Global
    if variable_global_exists(targetOption)
    {
        variable_global_set(targetOption,curOption);
    }
    
    //Do Action
    choices[curOption].action();
}

/// @desc Draws The Button And Other Stuff
drawBtn = function()
{
    //Draws Box And Text
    drawBox();
    
    //Draw Option
    var _text = $" < {choices[curOption].text} > ";
    textSetup(fnMain,fa_right,fa_middle,c_white,image_alpha);
    draw_text_transformed(rectX1 - 20,y,_text,textScaleX,textScaleY,0);
}