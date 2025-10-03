//Inherit
event_inherited();

//Set Amounts
maxAmount = 100;
currentAmount = 50;

//Drag
dragging = false;

//Change Var
if struct_exists(info,"changeVar")
{
	currentAmount = variable_global_get(info.changeVar);
}

//Functions
clickedJuice = function()
{
	
}

action = function()
{
	dragging = true;	
}