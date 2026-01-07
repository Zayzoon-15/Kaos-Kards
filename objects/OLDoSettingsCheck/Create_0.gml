//Inherit
event_inherited();

//Set Selected
checked = false;

//Set Image
image_index = image_number-1;

//Scale
checkXScale = 1;
checkYScale = 0;

//Functions
clickedJuice = function()
{
	//Set Scale
	rectXScale = 1.2;
	rectYScale = .9;
	
	//Set Text Scale
	setSize(1.2,.9);
	
	//Check Scale
	checkXScale = 1.2;
	checkYScale = .8;
}

action = function()
{
	//Juice
	clickedJuice();
	
	//Set Image
	image_speed = 1;
	image_index = 0;
	
	//Set Checked
	checked = !checked;
	
	//Sound
	if checked
	{
		audioPlaySfx(snSettingsCheck);
	} else audioPlaySfx(snSettingsUnCheck);
	
	//Action
	if struct_exists(info,"action")
	{
		info.action(checked);
	}
}