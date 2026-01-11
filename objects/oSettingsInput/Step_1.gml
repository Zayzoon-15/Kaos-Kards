///@desc Get Current Key

//Set Key
if targetKey != undefined
{
	key = variable_global_get(targetKey);
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
        timeSourceCreate(3,function(){
            
            key = keyboard_lastkey;
            selectingKey = false;
            
            //Change Global Var
            if targetKey != undefined
            {
            	variable_global_set(targetKey,key);
            }
            
        },[],time_source_units_frames);
		alarm[0] = 3;
		
		//Juice
		clickedJuice();
	}
	
	//Mouse
	if mouse_check_button_pressed(mb_any)
	{	
		//Set Key
        timeSourceCreate(3,function(){
            
            key = mouse_lastbutton;
            selectingKey = false;
            
            //Change Global Var
            if targetKey != undefined
            {
            	variable_global_set(targetKey,key);
            }
            
        },[],time_source_units_frames);
		
		//Juice
		clickedJuice();
	}
	
}