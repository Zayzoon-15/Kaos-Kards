///@desc Play Correct Songs

if room == rPrepare
{
	audioPlayGroupSong(global.musicGroups.bg,sgPrepare);
}

if room == rKaos
{
	audioPlayGroupSong(global.musicGroups.bg,sgKaos);
}

if room == rTournies
{
	audioPlayGroupSong(global.musicGroups.menu,sgKenu,30,true);
}