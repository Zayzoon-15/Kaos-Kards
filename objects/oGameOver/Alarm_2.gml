///@desc Player Death

//Play Explosion Sound
audioPlaySfx(snExplosion,.9,1.1);
	
//Create Explosions
repeat 6
{
	randomise();
	var _margin = 100;
	var _x = random_range(_margin,room_width-_margin);
	var _y = random_range(_margin,room_height-_margin);
	explosionEffect(_x,_y,false,3.5);
}

//Repeat
if !deathDone then alarm[2] = 10;
