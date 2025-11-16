
bgY = 0;

createSettings = function()
{
	//Pause
	global.paused = true;
	
	#region Deactiveate
    audio_pause_all();
	instance_deactivate_all(true);
	instance_activate_object(oGame);
	instance_activate_object(oExpandRes);
    instance_activate_object(oSound);
	
	#endregion
	
	#region Menu
	var _depth = -10;
	
	#region Create Main Buttons
	var _mainButtons = ["Audio","Video","Input","Game","Back"];
	var _mainLength = array_length(_mainButtons);
		
	for (var i = 0; i < _mainLength; ++i) {
			
		//Selected
		var _selected = false;
		if i == 0 then _selected = true;
			
		//Center Buttons
		var _center = room_height/2;
		var _gap = sprite_get_height(sSettingsButton)+25;
    
		var _top = (_mainLength-1)*(_gap/2);
		var _y = _center - _top + (i * _gap);
    
		//Create Buttons
		instance_create_depth(182,_y,_depth,oSettingsMenuBtn,{
			text : _mainButtons[i],
			selected : _selected
		})
			    
	}
	
	#endregion

	//Create Sub Menu
	instance_create_depth(816,352,_depth,oSettingsSubMenu,{
		image_xscale : 16,
		image_yscale : 12
	}); //Magic Numbers I Know -_-
	
	//Create Gear
	instance_create_depth(1265,708,_depth-2,oSettingsGear);
	#endregion
}

destroySettings = function()
{
	//Pause
	global.paused = false;
	
	//Destroy
	instance_destroy(oSettingsMenuBtn);
	instance_destroy(oParSettingsBox);
	instance_destroy(oSettingsGear);
	instance_destroy(oSettingsSubMenu);
	
	//Activate
    audio_resume_all();
	instance_activate_all();
}