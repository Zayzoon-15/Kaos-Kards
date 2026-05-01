typing = false;

//Clear Intros
ds_list_clear(global.songIntrosPlayed);

//Line Does Not Exist
var _array = ds_map_keys_to_array(global.songTracks);
for (var i = 0; i < array_length(_array); i++) {
	var _id = global.songTracks[? _array[i]];

    if string_upper(_array[i]) == string_upper(currentText)
    {
        //Play Song
        audioPlaySong(_array[i]);
        exit;
    }
}

show_message($"The Song '{currentText}' Does Not Exist");
