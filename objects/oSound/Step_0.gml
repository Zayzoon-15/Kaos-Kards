//Play Settings Song
if global.paused
{
    if !audio_is_playing(sgKetting)
    {
        audio_play_sound(sgKetting,10,true);
    }
    
    //Exit To Stop Other Code
    exit;
} else audio_stop_sound(sgKetting); //Stop Setting

//Start Sync Group
if !audio_sync_group_is_playing(musicGroup)
{
    audio_start_sync_group(musicGroup);
}

//Play Main Song
var _fadeTime = 10;
if room == rPrepare
{
    audio_sound_gain(sgPrepare,1,_fadeTime);
    audio_sound_gain(sgKaos,0,_fadeTime);
} else if room == rKaos {
    audio_sound_gain(sgPrepare,0,_fadeTime);
    audio_sound_gain(sgKaos,1,_fadeTime);
}