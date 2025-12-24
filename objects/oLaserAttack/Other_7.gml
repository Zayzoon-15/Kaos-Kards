
//Loop Laser
if sprite_index == sLaserStart 
{
    //Set Sprite
    sprite_index = sLaserLoop;
    
    //Start Attack
    alarm[1] = 10;
    alarm[2] = laserTime;
}

//Delete Laser
if sprite_index == sLaserEnd then instance_destroy();