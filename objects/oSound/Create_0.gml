//Audio
masterVol = 0;
musicVol = 0;
sfxVol = 0;

//Current Song
global.curMusic = noone;
global.curMusicGroup = noone;

//Groups
global.musicGroups = {
	bg : audioCreateSyncGroup([sgPrepare,sgKaos]),
	menu : audioCreateSyncGroup([sgKetting,sgKenu])
};