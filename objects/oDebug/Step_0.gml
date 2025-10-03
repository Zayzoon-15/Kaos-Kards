


//Debug Mode
if keyCheckPressed(global.keyDebug)
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
