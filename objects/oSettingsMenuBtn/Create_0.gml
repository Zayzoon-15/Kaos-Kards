//Position
boxX = x;
boxY = y;
targetX = x;
targetY = y;

//Image
xscale = image_xscale;
yscale = image_yscale;
scaleTime = .3;
shake = 0;
boxAlpha = .5;

//Clicking
pressed = false;

//Text
textTargetSize = 3;
textSize = textTargetSize;


//Action
action = function()
{
	//Back
	if text == "Back"
	{
		oSettings.destroySettings();
		exit;
	}
	
	//Change Menu
	oSettingsSubMenu.swapMenu(string_upper(text));
}

//Check Selected
alarm[0] = 1;