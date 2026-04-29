if showSongs
{
	var _songPos = audio_is_playing(global.curSongAudio) and global.curSongAudio != noone ? audio_sound_get_track_position(global.curSongAudio) : 0;
	var _string = $"Song: {global.curSong}\nTrack Pos: {_songPos}\nLoops: {loops}";
	
    textSetup(fnMain,fa_center,fa_top);
    draw_text(ROOM_CENTER.x,50,_string);
}