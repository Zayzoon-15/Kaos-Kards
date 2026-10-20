///@desc Connect Gamepad

var _gamepad = async_load[? "pad_index"];

switch (async_load[? "event_type"]) {
	case "gamepad discovered":
        array_push(global.gamepadsConnected, _gamepad);
        gamepad_set_axis_deadzone(_gamepad, 0.2);
        debugAlert("Gamepad Connected!");
    break;

    case "gamepad lost":
        var _index = array_get_index(global.gamepadsConnected, _gamepad);
        if _index >= 0 then array_delete(global.gamepadsConnected, _index, 1);
        debugAlert("Gamepad Lost!");
    break;
}

if array_length(global.gamepadsConnected) > 0 {
    global.gamepadMain = global.gamepadsConnected[0];
} else global.gamepadMain = undefined;