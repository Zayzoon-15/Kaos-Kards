function initSettings()
{
	//Window
	global.resolutions = [new Vector2(1920,1080),new Vector2(1600,900),new Vector2(1280,720),new Vector2(960,540),new Vector2(640,360)]
	global.currentRes = 2;
	setWindowToRes();
	
	//Audio
	global.muteAudio = false;
}



#region Buttons Stuff

///@desc Gets the info for the resolution button in the settings
function settingsButtonWindowRes()
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


function settingsButtonParticle()
{
	var _pos = 0;
	
	if global.partAmount == .5 then _pos = 1;
	if global.partAmount == .2 then _pos = 2;
	if global.partAmount == 0 then _pos = 3;
	
	return _pos;
}

#endregion