//Groups
musicGroup = audio_create_sync_group(true);
audio_play_in_sync_group(musicGroup,sgPrepare);
audio_play_in_sync_group(musicGroup,sgKaos);

//Audio
masterVol = 0;
musicVol = 0;
sfxVol = 0;