
transTime = 100;


gameMusic = audio_create_sync_group(true);
audio_play_in_sync_group(gameMusic,sgBeforeChaos);
audio_play_in_sync_group(gameMusic,sgTheKaos);

audio_sound_gain(sgTheKaos,0,0);

audio_start_sync_group(gameMusic);