//Inherit
event_inherited();

//Click
canClick = true;

//Options
reverse = false;
selection = 0;
currentSelection = {text:"EMPTY",action:function(){show_message("EMPTY")}};
totalOptions = 0;

//Get Selection
if struct_exists(info,"selection") then selection = info.selection;

//Get Reverse
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

//Set Offset X
if !fill
{
	offsetX = 10;
	if col == 1 then offsetX *=-1;
}

//Get Offset Y
if struct_exists(info,"offsetY") then offsetY = info.offsetY;

//Functions
changeSelection = function(_dir = 1)
{
	//Set Dir
	if reverse _dir *= -1;
	
	//Change Selection
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
