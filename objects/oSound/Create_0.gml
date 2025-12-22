//Audio
masterVol = 0;
musicVol = 0;
sfxVol = 0;

//Current Song
global.curMusic = noone;
global.curMusicGroup = noone;

//Groups
global.bgSyncGroup = audioCreateSyncGroup([sgPrepare,sgKaos]);
global.menuSyncGroup = audioCreateSyncGroup([sgKetting,sgKaos]);