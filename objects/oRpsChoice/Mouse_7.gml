///@desc Button Do Action
if pressed
{
	//Action
	timeSourceCreate(.8,function(){
		
		//Create Hands
		randomise();
		instance_create_layer(0,room_height/2,"Attacks",oRpsHand,{
	        handId : 0,
			action : choiceId
	    });
	    instance_create_layer(0,room_height/2,"Attacks",oRpsHand,{
	        handId : 1,
			action : irandom_range(0,2)
	    });
		
		//Destroy
		instance_destroy();
	});
	
	//Disable Other Buttons
	with oRpsChoice {canClick = false;}
	
	//Set Pressed
	pressed = false;
}