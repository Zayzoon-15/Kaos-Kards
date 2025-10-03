

if keyCheckPressed(global.keyPause)
{
	if global.paused
	{
		destroySettings();
	} else createSettings();
}