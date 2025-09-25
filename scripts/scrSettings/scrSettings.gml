function initSettings()
{
	//Window
	global.resolutions = [new Vector2(1920,1080),new Vector2(1280,720),new Vector2(960,540),new Vector2(640,360)]
	global.currentRes = 1;
	setWindowToRes();
	
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