///@desc Enemy Death

//Animate Photo
with oEnemyPhoto
{
	//Shake Photo
	shake = 10;
	
	//Play Explosion Sound
	audioPlaySfx(snExplosion,.9,1.1);
	
	//Create Explosions
	repeat 2
	{
		randomise();
		var _margin = 80;
		var _x = random_range(x-_margin,x+_margin);
		var _y = random_range(y-_margin,y+_margin);
		explosionEffect(_x,_y,false);
	}
}

//Repeat
if !deathDone then alarm[1] = 10;