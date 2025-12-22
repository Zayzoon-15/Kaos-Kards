///@desc Play Correct Songs

if room == rPrepare
{
	audioPlayGroupSong(global.bgSyncGroup,sgPrepare);
}

if room == rKaos
{
	audioPlayGroupSong(global.bgSyncGroup,sgKaos);
}

if room == rTournies
{
	audioPlaySong(sgKenu);
}