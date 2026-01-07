//Inherit
event_inherited();

//Key
key = "NAN";
selectingKey = false;

//Condition
info.condition = function(){return global.mobile;};
info.reason = "This Is Only Available On Desktop";

//Action
action = function()
{
	//Juice
	clickedJuice();
	
	//Select Key
	selectingKey = true;
}