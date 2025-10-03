///@desc Get Current Key

//Set Key
if struct_exists(info,"key") and !selectingKey
{
	key = keyToString(variable_global_get(info.key));
}

//Select Key
if selectingKey
{
	//Random Keys
	randomize();
	key = choose("?","&","#","@","!","$","%","*");
	
	//Keyboard
	if keyboard_check_pressed(vk_anykey)
	{
		//Set Key
		alarm[0] = 3;
		
		//Juice
		clickedJuice();
	}
	
	//Mouse
	if mouse_check_button_pressed(mb_any)
	{	
		//Set Key
		alarm[1] = 3;
		
		//Juice
		clickedJuice();
	}
	
}