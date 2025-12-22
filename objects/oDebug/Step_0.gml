//Debug Mode
if keyCheckPressed(global.keyDebug)
{
    //Set Debug Mode
    debugMode = !debugMode;
    show_debug_overlay(debugMode);
    
    //Message
    var _string = debugMode ? "DEBUG MODE ON" : "DEBUG MODE OFF";
    createAlertMessage(_string);
    
    //Sound For Fun
    audioPlaySfx(snRoundEnd);
}

//Restart Room
if keyboard_check(vk_control) and keyboard_check_pressed(ord("R")){
	room_restart();
}