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

///@desc Gets the postion of the objects x based on the window size
///It uses the objects xstart to choose the position (This can be changed)
///@arg {bool} _onRight If it should stick to the right side
///@arg {real} _xOffset The offset of the x position (Default = xstart)
function getPosToWindow(_onRight,_xOffset = xstart)
{
	//Vars
	var _camPos,_targetPos;
	
	//Set Target
	if _onRight
	{
		var _camRight = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]);
		_targetPos = _camRight - (room_width - (_xOffset));
	} else _targetPos = camera_get_view_x(view_camera[0])+_xOffset;
	
	//Return
	return 	_targetPos;
}


///@desc Checks of the given input key is pressed
///@arg {real} _key The input key
function keyCheckPressed(_key)
{
	if keyboard_check_pressed(_key) or mouse_check_button_pressed(_key)
	{
		return true;
	} else return false;
	
}