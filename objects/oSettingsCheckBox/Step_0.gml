event_inherited();

var _touching = point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,(bbox_right+15)+(string_width(text)*textSize),bbox_bottom);
if mouse_check_button_pressed(mb_left) and _touching
{
	checked = !checked;
	image_speed = 1;
	image_index = 0;

	if struct_exists(info,"action")
	{
		info.action(checked);
	}	
}

if col == 0
{
	offsetX = -sprite_width;
} else offsetX = -string_width(text)*2;

if checked
{
	sprite_index = sSettingsCheckOn;
} else sprite_index = sSettingsCheckOff;

if struct_exists(info,"condition")
{
	checked = info.condition();
}