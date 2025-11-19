//Update Listener Position
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;
audio_listener_position(_x,_y,0); //Set Pos
audio_listener_set_orientation(0, 0, 0, 1000, 0, -1, 0); //DONT TOUCH

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