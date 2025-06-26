//Make Sure Song Is Playing
if !audio_sync_group_is_playing(menuMusic)
{
    audio_start_sync_group(menuMusic);
}


if gamestate == GAMESTATE.PREPARE
{
    //Stop Song
    audio_sound_gain(sgKenu,0,transTime);
    audio_sound_gain(sgKutorial,0,transTime);
} else {
	if room == rTutorial
    {
        //Play Tutorial
        audio_sound_gain(sgKenu,0,transTime);
        audio_sound_gain(sgKutorial,1.5,transTime);
    } else { 
        //Play Menu
        audio_sound_gain(sgKenu,1,transTime);
        audio_sound_gain(sgKutorial,0,transTime);
    }
}

//Destroy Group
if audio_sound_get_gain(sgKenu) <= 0 and audio_sound_get_gain(sgKutorial) <= 0
{
    audio_stop_sync_group(menuMusic);
    audio_destroy_sync_group(menuMusic);
    instance_destroy();
}
