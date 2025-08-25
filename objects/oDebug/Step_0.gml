
//Debug Mode
var _debugKey = keyboard_check_pressed(vk_f1);

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




