typing = false;

if ds_map_exists(global.songTracks,currentText)
{
    audioPlaySong(currentText);
    
} else show_message($"Song 'sg{currentText}' Does Not Exist");