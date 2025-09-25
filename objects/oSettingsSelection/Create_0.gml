//Inherit
event_inherited();

selection = 0;
currentSelection = {text:"EMPTY",action:function(){show_message("EMPTY")}};
totalOptions = 0;

if struct_exists(info,"options")
{
	totalOptions = array_length(info.options);
}

textSize = 3;
