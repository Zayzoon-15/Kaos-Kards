
transTime = 100;


menuMusic = audio_create_sync_group(true);
audio_play_in_sync_group(menuMusic,sgKenu);
audio_play_in_sync_group(menuMusic,sgKutorial);

audio_sound_gain(sgKutorial,0,0);

audio_start_sync_group(menuMusic);