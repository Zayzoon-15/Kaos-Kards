///@desc Save Game

if window_get_fullscreen()
{
	global.window = "Fullscreen";
}

SaveFile.GameSave();
SaveFile.SettingsSave();