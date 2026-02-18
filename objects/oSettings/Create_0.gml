//Set Position
x = 462;
y = 360;

//Menu
lastButton = 0;

//Audio
curSong = noone;

//Bg
bgY = 0;


//Functions
createSettings = function()
{
	//Setup
	instance_deactivate_object(oParButton);

	//Play Song
	audioPlayGroupSong(global.musicGroups.menu,sgKetting,300);
	
	#region Menu
	var _depth = -10;
	
	#region Create Main Buttons
	var _mainButtons = ["Audio","Video","Input","Game","Back"];
	var _mainLength = array_length(_mainButtons);
		
	for (var i = 0; i < _mainLength; ++i) {
			
		//Selected
		var _selected = false;
		if i == lastButton then _selected = true;
			
		//Center Buttons
		var _center = room_height/2;
		var _gap = sprite_get_height(sSettingsButton)+25;
    
		var _top = (_mainLength-1)*(_gap/2);
		var _y = _center - _top + (i * _gap);
    
		//Create Buttons
		instance_create_depth(167,_y,_depth,oSettingMenuBtn,{
			targetMenu : _mainButtons[i],
			selected : _selected,
            btnId : i
		});
	}
	
	#endregion

	//Create Sub Menu
	instance_create_depth(967,372,_depth,oSettingsSubMenu,{
		image_xscale : 11,
		image_yscale : 12.3
	}); //Magic Numbers I Know -_-
    
	#endregion
}

destroySettings = function()
{
	//Destroy
	instance_destroy(oSettingMenuBtn);
	instance_destroy(oParSettingsBtn);
	instance_destroy(oSettingsSubMenu);
    instance_destroy();
	
	//Play Song
	audioPlayGroupSong(global.musicGroups.bg,global.lastSong);
    
    //Save
    SaveFile.SettingsSave();
    
    //Reactivate Pause Menu
    oPause.settingsLastButton = lastButton;
    instance_activate_object(oPauseResume);
    instance_activate_object(oPauseReturn);
    instance_activate_object(oPauseSettings);
}