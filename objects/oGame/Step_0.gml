
//Keyboard
global.keyDiscard = keyboard_check_pressed(ord("Z"));

//Debug Mode
var _debugKey = keyboard_check(vk_control) and keyboard_check(vk_alt) and keyboard_check_pressed(ord("D"));

if _debugKey
{
    if !is_debug_overlay_open()
    {
        show_debug_overlay(true);
        createAlertMessage("DEBUG MODE ON");
    } else { 
        show_debug_overlay(false);
        createAlertMessage("DEBUG MODE OFF");
    }
}