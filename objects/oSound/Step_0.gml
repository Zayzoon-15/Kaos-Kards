//Update Listener Position
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;
audio_listener_position(_x,_y,0); //Set Pos
audio_listener_set_orientation(0, 0, 0, 1000, 0, -1, 0); //DON'T TOUCH




//Secret Song (For Felx)
if room == rPrepare
{
    prepareTimer += delta_time / 1000000; // seconds

    var _length = audio_sound_length(global.curSong);

    if prepareTimer >= _length
    {
        prepareTimer = 0;
        prepareLoopCount++;
        
        //Play Secret Song
        if prepareLoopCount >= 3
        {
            if global.curSong == sgPrepare
            {
                audioPlayGroupSong(global.musicGroups.bg,sgPrepareExtended);
            } else if global.curSong == sgPrepareExtended {
                audioPlayGroupSong(global.musicGroups.bg,sgPrepare);
                
                prepareLoopCount = 0;
                prepareTimer = 0;
            }
        }
    }
} else {
    prepareTimer = 0;
    prepareLoopCount = 0;
}