//Inherit
event_inherited();

opCenter = x;
opXScale = 2;
opYScale = 2;

options = [
{
	text:"Selection1",
	action:function(){}
},
{
	text:"Selection2",
	action:function(){}
},
{
	text:"Selection3",
	action:function(){}
},
];
currentSelection = 0;
selectVar = undefined;

if struct_exists(info,"options") then options = info.options;
if struct_exists(info,"selectVar"){
	selectVar = info.selectVar;
	currentSelection = variable_global_get(selectVar);
}

clickedJuice = function()
{
	//Set Scale
	rectXScale = 1.2;
	rectYScale = .9;
	
	//Set Text Scale
	setSize(1.2,.9);
	
	//Options Scale
	opXScale = 2.2;
	opYScale = 1.9;
}

action = function()
{	
	//Juice
	clickedJuice();
	
	//Change Selection
	if mouse_x > opCenter
	{
		currentSelection ++;
		
		//Sound
		audioPlaySfx(snSettingsSelect,1,1.1);
	} else {
		currentSelection --;
		
		//Sound
		audioPlaySfx(snSettingsSelect,.8,.9);
	}
	
	//Clamp
	if currentSelection > array_length(options)-1
	{
		currentSelection = 0;
	}
	
	if currentSelection < 0
	{
		currentSelection = array_length(options)-1;
	}
	
	//Do Action
	variable_global_set(selectVar,currentSelection);
	options[currentSelection].action();
}