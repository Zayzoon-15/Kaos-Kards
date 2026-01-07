//Inherit
event_inherited();

//Check Scale
checkXScale = 1;
checkYScale = 1;

//Set Checked
if checkedFunc != undefined
{
    if is_method(checkedFunc)
    {
        checked = checkedFunc();
    } else checked = checkedFunc;
}

/// @desc Draws The Button And Other Stuff
drawBtn = function()
{
    //Draws Box And Text
    drawBox();
    
    //Draw Checkmark
    var _x = (rectX1-20)-sprite_get_width(sprite_index)/2;
    draw_sprite_ext(sprite_index,image_index,_x,y,checkXScale,checkYScale,image_angle,image_blend,image_alpha);
    
    //Disabled
    if disabled
    {
        draw_sprite_ext(sprite_index,image_index,_x,y,checkXScale,checkYScale,image_angle,c_black,image_alpha*.5);
    }
}

clickedJuice = function()
{
	//Set Scale
	rectXScale = 1.03;
	rectYScale = .9;
	
	//Set Text Scale
    textXScale = 1.3;
    textYScale = .9;
    
	//Set Check Scale
	checkXScale = 1.3;
    checkYScale = .8;
}

//Action
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
    btnAction(checked);
}