
//Keyboard
global.keyDiscard = keyboard_check_pressed(ord("Z"));


#region Clamp Health

global.playerHp = floor(global.playerHp);
global.playerTempHp = floor(global.playerTempHp);
global.enemyHp = floor(global.enemyHp);
global.enemyTempHp = floor(global.enemyTempHp);
global.playerHp = clamp(global.playerHp,0,100);
global.playerTempHp = clamp(global.playerTempHp,0,100);
global.enemyHp = clamp(global.enemyHp,0,100);
global.enemyTempHp = clamp(global.enemyTempHp,0,100);

#endregion


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