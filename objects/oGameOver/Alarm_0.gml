///@desc Finish Death

//Set Death Done
deathDone = true;

//Create Ui
timeSourceCreate(3,function(){
	
	//Show Message For Now
	var _text = playerWon ? "You Win" : "You Lose";
	createAlertMessage(_text);
	
	//Create Button For Now
	instance_create_layer(room_width/2,room_height/2,"Ui",oRetryButton);
});