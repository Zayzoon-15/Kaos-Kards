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
	var _xOffset = 120;
	var _y = ROOM_CENTER.y + 50;
	instance_create_layer(ROOM_CENTER.x + _xOffset,_y,"Ui",oRetryButton);
	instance_create_layer(ROOM_CENTER.x - _xOffset,_y,"Ui",oKaosExitButton);
});