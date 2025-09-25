
selection ++;

if selection > totalOptions-1
{
	selection = 0;
}

//Action
if struct_exists(info,"options")
{
	currentSelection = info.options[selection];
	currentSelection.action();
}