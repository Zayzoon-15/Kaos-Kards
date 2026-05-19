if showSongs
{
	var _songPos = audio_is_playing(global.curSongAudio) and global.curSongAudio != noone ? audio_sound_get_track_position(global.curSongAudio) : 0;
	var _songLength = audio_is_playing(global.curSongAudio) and global.curSongAudio != noone ? audio_sound_length(global.curSongAudio) : 0;
    var _string = $"Song: {global.curSong}\nTrack Pos: {_songPos}/{_songLength}\nLoops: {loops}";
	
    textSetup(fnMain,fa_center,fa_top);
    draw_text(display_get_gui_width()/2,50,_string);
}