///@desc Enemy Death


//Animate Photo
with oEnemyPhoto
{
	//Shake Photo
	shake = 10;
	
	//Play Explosion Sound
	audioPlaySfx(snExplosion,.9,1.1);
	
	//Create Explosions
    if global.explosionsAfter
    {
    	repeat 2
    	{
    		var _margin = 80;
    		var _x = random_range(x-_margin,x+_margin);
    		var _y = random_range(y-_margin,y+_margin);
    		effectExplosion(_x,_y,false);
    	}
    } else effectExplosion(x,y,false,3.2);
}

//Repeat
if !deathDone and global.explosionsAfter then alarm[1] = 10;