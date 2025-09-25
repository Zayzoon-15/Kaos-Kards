// Inherit the parent event
event_inherited();

if struct_exists(info,"options")
{
	currentSelection = info.options[selection];
}