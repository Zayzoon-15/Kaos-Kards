event_inherited();

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