if audio_sound_get_gain(targetSong) <= 0
{
    if endMethod == "Stop" then audio_stop_sound(targetSong);
    if endMethod == "Pause" {
        
        //Set Paused
        ds_map_add(global.songsPaused,songInfo.name,targetSong);
        
        //Pause
        audio_pause_sound(targetSong);
    }
    
    instance_destroy();
}