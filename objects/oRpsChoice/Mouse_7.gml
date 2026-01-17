///@desc Button Do Action
if pressed
{
	//Action
	timeSourceCreate(.8,function(){
		//Create Hands
		instance_create_layer(0,room_height/2,"Attacks",oRpsHand,{
	        handId : 1,
			action : choiceId
	    });
	    instance_create_layer(0,room_height/2,"Attacks",oRpsHand,{
	        handId : 0,
			action : irandom_range(0,2)
	    });
		
		//Destroy
		instance_destroy();
	});
	
	//Fade Text
	with oRpsText {fade = true;}
	
	//Disable Other Buttons
	with oRpsChoice {canClick = false;}
	
	//Set Pressed
	pressed = false;
}