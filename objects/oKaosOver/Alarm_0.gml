///@desc Round Over
if !instance_exists(oParAttacks)
{
    showMessage("Round Over!",display_get_gui_width()/2,display_get_gui_height()/2-100);

    audio_play_sound(snRoundOver,0,false);
    
    alarm[1] = 30;
} else alarm[0] = 10;
