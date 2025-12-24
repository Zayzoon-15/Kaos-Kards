//Audio
masterVol = 0;
musicVol = 0;
sfxVol = 0;

//Current Song
global.curSong = noone;
global.lastSong = noone;
global.curSongGroup = noone;

//Groups
global.musicGroups = {
	bg : audioCreateSyncGroup([sgPrepare,sgKaos,sgPrepareExtended]),
	menu : audioCreateSyncGroup([sgKetting,sgKenu])
};

//Extended Version
prepareLoopCount = 0;