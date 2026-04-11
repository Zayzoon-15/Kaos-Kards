//Death Done
deathDone = false;

//Position
x = room_width/2;
y = (room_height/2) - 50; 

//Sprite
fade = false;
image_index = playerWon;
image_alpha = 0;

//Stop Music
audioPlaySong(noone,30);

//Play Sound
audioPlaySfx(snUhOh);

//Player Won
if playerWon
{
	//Set Enemy Photo
	with oEnemyPhoto
	{
		//Set Animation
		Enemy.PlayAnim("hurt");
		canHover = false;
		
		//Set Death Photo
		timeSourceCreate(5,function(){
			Enemy.PlayAnim("death");
		});
	}
	
	//Start Death
	alarm[1] = 90;
	
} else { //Player Lost
	
	//Set Enemy Photo
	with oEnemyPhoto
	{
		//Set Animation
		Enemy.PlayAnim("win");
		canHover = false;
		
		//Stars
		effectStar(x,y,10,false,10,15);
	}
	
	//Start Death
	alarm[2] = 90;
}


//Start Death Timer
alarm[0] = 60*7;