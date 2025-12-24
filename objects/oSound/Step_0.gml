//Update Listener Position
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;
audio_listener_position(_x,_y,0); //Set Pos
audio_listener_set_orientation(0, 0, 0, 1000, 0, -1, 0); //DONT TOUCH


//Loop Songs
if !audio_is_playing(global.curSong)
{
	#region Secret Prepare Song (Felx I Shall Smite Thee For This)
		
		//Prepare Loop Count
		if global.curSong == sgPrepareExtended
		{
			global.curSong = sgPrepare;
			prepareLoopCount = 0;
		}
	
		if global.curSong == sgPrepare
		{
			prepareLoopCount ++;
		
			if prepareLoopCount >= 4 {
				audioPlayGroupSong(global.musicGroups.bg,sgPrepareExtended,0);
				exit;
			}
		}
	
	#endregion
	
	//Play Song Again
	audio_play_sound(global.curSong,10,false);
}

//Loop Group
if !audio_sync_group_is_playing(global.curSongGroup)
{
	audioPlayGroupSong(global.curSongGroup,global.curSong);
}