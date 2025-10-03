function initSettings()
{
	//Window
	global.resolutions = [new Vector2(1920,1080),new Vector2(1280,720),new Vector2(960,540),new Vector2(640,360)]
	global.currentRes = 1;
	setWindowToRes();
	
	//Audio
	global.unFocusMute = false;
	
	//Input
	global.keyDiscard = ord("Z");
	global.keyFullscreen = vk_f11;
	global.keyDebug = 220;
	global.keyPause = vk_escape;
}


function keyToString(_key)
{	
	//Get Key Type
	switch _key
	{
		default : return chr(_key);		
		case vk_escape: return "Escape";		
		case vk_f1: return "F1";		
		case vk_f2: return "F2";		
		case vk_f3: return "F3";		
		case vk_f4: return "F4";		
		case vk_f5: return "F5";		
		case vk_f6: return "F6";		
		case vk_f7: return "F7";		
		case vk_f8: return "F8";		
		case vk_f9: return "F9";		
		case vk_f10: return "F10";		
		case vk_f11: return "F11";		
		case vk_f12: return "F12";		
		case 220: return "Backslash";
		case 1: return "Left Mouse";
		case 2: return "Right Mouse";
		case 3: return "Middle Mouse";
	}
	
}


#region Buttons Stuff

///@desc Gets the info for the resolution button in the settings
function settingsGetWindowRes()
{
	var _array = [];
	
	for (var i = 0; i < array_length(global.resolutions); ++i) {
		
		//Set Action
		var _action = function(_selection)
		{
			global.currentRes = _selection;
			setWindowToRes();
		}
		
		//Set Info
		var _info = {
			text : $"{global.resolutions[i].x}x{global.resolutions[i].y}",
			action : _action
		};
		
		//Add To Array
		array_push(_array,_info);
	}

	return _array;
	
}

#endregion