event_inherited();

//Ease
textXScale = lerp(textXScale,textSize*image_xscale,.2);
textYScale = lerp(textYScale,textSize*image_yscale,.2);

//Can Click
if struct_exists(info,"disabled") then canClick = info.disabled();

//Clicked
var _touching = point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,(bbox_right+15)+(string_width(text)*textSize),bbox_bottom);
if mouse_check_button_pressed(mb_left) and _touching and canClick
{
	//Set Checked
	checked = !checked;
	
	//Juice
	textXScale = textSize + .2;
	textYScale = textSize - .5;
	
	//Set Sprite
	image_speed = 1;
	image_index = 0;

	//Action
	if struct_exists(info,"action")
	{
		info.action(checked);
	}	
}

//Position
if col == 0
{
	offsetX = -sprite_width;
} else offsetX = -string_width(text)*2;
if fill then offsetX = -(string_width(text)*2 - sprite_width/2);

//Sprite
if checked
{
	sprite_index = sSettingsCheckOn;
} else sprite_index = sSettingsCheckOff;

//Condition
if struct_exists(info,"condition") then checked = info.condition();