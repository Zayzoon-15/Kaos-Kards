
//Start Laser
if sprite_index == sLaserStart
{
    //Set Sprite
    sprite_index = sLaser;
    
    //Hurt
    alarm[1] = 5;
}

//Finish Laser
if sprite_index == sLaserFinish
{
    instance_destroy();
}