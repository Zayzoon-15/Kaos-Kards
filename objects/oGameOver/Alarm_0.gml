///@desc Finish Death

//Set Death Done
deathDone = true;

//Create Ui
timeSourceCreate(3,function(){
	
	//Sound
	if playerWon
	{
		audioPlaySfx(snWin);
	} else audioPlaySfx(snLose);
	
	//Show Game Text
	fade = true;
	setSize(1.4,.3);
	
	//Stars
	if playerWon then starEffect(x,y,10,false);
	
	//Create Button For Now
	instance_create_layer(room_width/2,(room_height/2) + 50,"Ui",oRetryButton);
});