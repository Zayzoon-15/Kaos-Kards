//Death Done
deathDone = false;

//Position
x = room_width/2;
y = (room_height/2) - 50; 

//Sprite
fade = false;
image_index = playerWon;
image_alpha = 0;

//Play Sound
audioPlaySfx(snUhOh);

//Player Won
if playerWon
{
	//Set Enemy Photo
	with oEnemyPhoto
	{
		//Set Animation
		currentAnim = 1;
		canHover = false;
		
		//Set Death Photo
		timeSourceCreate(5,function(){
			currentAnim = 3;
		});
	}
	
	//Start Death
	alarm[1] = 90;
	
} else { //Player Lost
	
	//Set Enemy Photo
	with oEnemyPhoto
	{
		//Set Animation
		currentAnim = 2;
		canHover = false;
		
		//Stars
		starEffect(x,y,10,false,10,15);
	}
	
	//Start Death
	alarm[2] = 90;
}


//Start Death Timer
alarm[0] = 60*7;