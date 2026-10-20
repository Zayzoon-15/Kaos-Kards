//Start Game
var _loaded = audio_group_is_loaded(agMusic) and audio_group_is_loaded(agSfx) and audio_group_is_loaded(agVoice);
if _loaded and !alarm[0] and room == rSetup
{
    alarm[0] = 1;
}

//Delta
delta_step();

//Move Cursor With Controller
if global.gamepadMain != undefined {
    
    //Get Axis
    var _axisX = gamepad_axis_value(global.gamepadMain, gp_axisrh);
    var _axisY = gamepad_axis_value(global.gamepadMain, gp_axisrv);

    //Move Cursor
    if abs(_axisX) > .2 or abs(_axisY) > .2 {
        var _new_x = window_mouse_get_x() + (_axisX * global.gamepadCursorSpeed * 8);
        var _new_y = window_mouse_get_y() + (_axisY * global.gamepadCursorSpeed * 8);
        
        //Clamp To Game Window
        _new_x = clamp(_new_x, 0, window_get_width());
        _new_y = clamp(_new_y, 0, window_get_height());
        
        //Move Actual Mouse
        window_mouse_set(_new_x, _new_y);
    }
    
}