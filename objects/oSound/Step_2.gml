//Loop Songs
if !audio_is_playing(global.curSong) and global.curSong != noone
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
		
			if prepareLoopCount >= 3 {
				audioPlayGroupSong(global.musicGroups.bg,sgPrepareExtended,0);
				exit;
			}
		}
	
	#endregion
    
    //Show Message
    if room == rMusicTest
    {
        loopCount ++;
        createAlertMessage($"Looped X{loopCount}");
    }
	
	//Play Song Again
	audio_play_sound(global.curSong,10,false);
}

//Loop Group
//if !audio_sync_group_is_playing(global.curSongGroup)
//{
//	audioPlayGroupSong(global.curSongGroup,global.curSong);
//}