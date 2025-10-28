

if keyCheckPressed(global.keyPause) and !global.midTrans
{
	if global.paused
	{
		destroySettings();
	} else createSettings();
}