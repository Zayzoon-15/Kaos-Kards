///@desc Play Correct Songs

if room == rPrepare
{
	prepareLoopCount = 0; //For Secret Song
	audioPlayGroupSong(global.musicGroups.bg,sgPrepare);
}

if room == rKaos
{
	prepareLoopCount = 0; //For Secret Song
	audioPlayGroupSong(global.musicGroups.bg,sgKaos);
}

if room == rTournies
{
	audioPlayGroupSong(global.musicGroups.menu,sgKenu);
}