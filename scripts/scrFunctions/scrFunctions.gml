//Functions that make stuff easier to do such as changing an objects size


///@desc Sets the size of the object to the given values
///If y is not set y will be the same as x
///@arg {real} _x The x scale
///@arg {real} _y The y scale
function setSize(_x,_y = _x)
{
    image_xscale = _x;
    image_yscale = _y;
}


///@desc Sets the variables xscale and yscale
///Keep in mind you need to have the variables: xscale, yscale
///@arg {real} _x The x scale
///@arg {real} _y The y scale
function squash(_x,_y)
{
    xscale = _x;
    yscale = _y;
}


///@desc Checks if the mouse is touching the given instance
///@arg {Asset.GMObject} _inst The instance to check (by default: self)
function touchingMouse(_inst = self)
{
    if position_meeting(mouse_x,mouse_y,_inst)
    {
        return true;
    } else return false;
}

///@desc Sets up the text values
///Keep in mind you do need to reset everything after wards
///@arg {Asset.GMFont} _font The font
///@arg {Constant.HAlign} _halign The horizontal alignment
///@arg {Constant.VAlign} _valign The vertical alignment
///@arg {Constant.Color} _color The color (by default : White)
///@arg {real} _alpha The alpha (by default : 1)
function setupText(_font,_halign,_valign,_color=c_white,_alpha=1)
{
    draw_set_font(_font);
    draw_set_halign(_halign);
    draw_set_valign(_valign);
    draw_set_color(_color);
    draw_set_alpha(_alpha)
}


///@desc Resets all draw values
function resetDraw()
{
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_font(fnMain);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}


///@desc Gives you the value of an animated curve
///You have to change the position yourself
///@arg {Asset.GMAnimCurve} _asset The animation curve
///@arg {real} _pos The position of the animation
///@arg {string} _name The name of the value to get
function getAnimValue(_asset,_pos,_name = "x")
{
    var _curveStruct = animcurve_get(_asset);
    var _channel = animcurve_get_channel(_curveStruct,_name);
    
    var _value = animcurve_channel_evaluate(_channel, _pos);
    
    return _value;
}