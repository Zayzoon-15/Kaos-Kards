//Audio
masterVol = 0;
musicVol = 0;
sfxVol = 0;

//Current Song
global.curSong = noone;
global.lastSong = noone;
global.curSongGroup = noone;

#region Mixer

global.soundMixer = ds_map_create();

global.soundMixer[? sgRetro1] = .9;
global.soundMixer[? sgRetro2] = .8;

#endregion

//Groups
global.musicGroups = {
	bg : audioCreateSyncGroup([sgPrepare,sgKaos,sgPrepareExtended]),
	menu : audioCreateSyncGroup([sgKetting,sgKenu])
};

//Extended Version Secret
loopCount = 0;
loopTimer = undefined;