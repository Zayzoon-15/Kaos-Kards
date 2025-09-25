//Inherit
event_inherited();

//Options
reverse = false;
selection = 0;
currentSelection = {text:"EMPTY",action:function(){show_message("EMPTY")}};
totalOptions = 0;

//Get Selection
if struct_exists(info,"selection") then selection = info.selection;

//Get Revers
if struct_exists(info,"reverse") then reverse = info.reverse;

//Get Total Option
if struct_exists(info,"options")
{
	totalOptions = array_length(info.options);
	currentSelection = info.options[selection];
}

//Text
textSize = 3;

//Button
boxXScale = 1;
boxYScale = 1;


//Functions
changeSelection = function(_dir = 1)
{
	selection += _dir;
	if selection > totalOptions-1 then selection = 0;
	if selection < 0 then selection = totalOptions-1;

	
	//Juice
	boxXScale = 1.2;
	boxYScale = .8;

	//Action
	if struct_exists(info,"options")
	{
		currentSelection = info.options[selection];
		currentSelection.action(selection);
	}	
}
