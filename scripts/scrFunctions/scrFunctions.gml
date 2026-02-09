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
///If y is not set y will be the same as x
///@arg {real} _x The x scale
///@arg {real} _y The y scale
function squash(_x,_y = _x)
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
function textSetup(_font,_halign,_valign,_color=c_white,_alpha=1)
{
    draw_set_font(_font);
    draw_set_halign(_halign);
    draw_set_valign(_valign);
    draw_set_color(_color);
    draw_set_alpha(_alpha)
}


///@desc Resets all draw values
function drawReset()
{
    gpu_set_blendmode(bm_normal);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_font(fnMain);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    gpu_set_tex_filter(false);
}


///@desc Gives you the value of an animated curve
///You have to change the position yourself
///@arg {Asset.GMAnimCurve} _asset The animation curve
///@arg {real} _pos The position of the animation
///@arg {string} _name The name of the value to get
function animGetValue(_asset,_pos,_name = 0)
{
    var _curveStruct = animcurve_get(_asset);
    var _channel = animcurve_get_channel(_curveStruct,_name);
    
    var _value = animcurve_channel_evaluate(_channel, _pos);
    
    return _value;
}

///@desc Gets the postion of the objects x based on the window size
///It uses the objects xstart to choose the position (This can be changed)
///@arg {bool} _onRight If it should stick to the right side
///@arg {real} _xOffset The offset of the x position to the window side (Default = xstart)
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


///@desc Checks to see if the message given is received
///@arg {string} _message The message to receive
///@arg {function} _func What to do if it receives the message
///@arg {bool} _sameAs Only recive the message if its from the current objects sprite (Default = false)
function broadcastSprite(_message,_func,_sameAs = false)
{
    //Can Receive Message
    var _canReceive = true;
    
    //Check If Same Sprite
    if _sameAs
    {
        if layer_instance_get_instance(event_data[? "element_id"]) == id
        {
            _canReceive = true;
        } else _canReceive = false;
    }
    
    //Check Message
    if event_data[? "event_type"] == "sprite event" and _canReceive
    {
        //Do The Function
        if event_data[? "message"] == _message
        {
            _func();
        }
    }
}


///@desc Checks to see if the message given is received
///@arg {string} _message The message to receive
///@arg {function} _func What to do if it receives the message
function broadcastSequence(_message,_func)
{    
    //Check Message
    if event_data[? "event_type"] == "sequence event"
    {
        //Do The Function
        if event_data[? "message"] == _message
        {
            _func();
        }
    }
}


/// @desc Creates and starts a time source
/// @param {real} _time The amount of time
/// @param {function} _action The action to preform
/// @param {array} [_args] The arguments for the action
/// @param {constant.timesourceunits} _units [seconds] The unit source to use
/// @param {constant.timesource} [_source] [game] The time source to use
/// @returns {Id.TimeSource} The time source
function timeSourceCreate(_time,_action,_args = [],_units = time_source_units_seconds,_source = time_source_game)
{
    var _timeSource = time_source_create(_source, _time, _units, _action,_args);
    time_source_start(_timeSource);
    
    return _timeSource;
}


/// @desc Creates an array of integers from the min value to the max value
/// @param {real} _min The starting number
/// @param {real} _max The ending number
/// @returns {Array<Real>} An array containing the range
function arrayCreateRange(_min, _max) {
    var _result = [];
    var _length = _max - _min + 1;
    
    //Check if the range is valid
    if _length <= 0 then return _result;
    
    //Grow Array
    _result = array_create(_length, 0); 

	//Add To Array
    for (var i = 0; i < _length; i++;) {
        _result[i] = _min + i*20;
    }
	
	//Return Final Array
    return _result;
}


/// @desc Chooses a random number or item from the given array and does not repeat them
///You can use arrayCreateRange to make a range
/// @param {array<any*>} _array An array with the numbers or items you want
function randomNonRepeat(_array) {
	
    //Get the length of the array and choose any one index except the last index
    var _length = array_length(_array);
    var _chosenIndex = irandom_range(0, _length - 2);

    //Remember what we choose
    var _result = _array[_chosenIndex];

    //Move the chosen result to the end of the array
    array_delete(_array, _chosenIndex, 1);
    array_push(_array, _result);

   //Return the result
    return _result;

}

///@desc Swaps to indexes in an array
///@param {array} _array The target array
///@param {real} _indexA The first index
///@param {real} _indexB The second Index
function arraySwapIndex(_array,_indexA,_indexB)
{
	var _temp = _array[_indexA];
    _array[_indexA] = _array[_indexB]; 
    _array[_indexB] = _temp;
}


