
//Debug Key
var _debugKey = keyboard_check_pressed(vk_f1) or keyboard_check_pressed(220) or mouse_check_button_pressed(mb_middle);

//Debug Mode
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
