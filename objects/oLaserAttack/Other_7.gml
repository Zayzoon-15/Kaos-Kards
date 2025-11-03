
//Loop Laser
if sprite_index == sLaserStart 
{
    //Set Sprite
    sprite_index = sLaserLoop;
    
    //Damaging
    var _timeSource = time_source_create(time_source_game,5,time_source_units_frames,function()
    {
        currentlyDamaging = true;
    });
    time_source_start(_timeSource);
    
    //Start Attack
    alarm[1] = 10;
    alarm[2] = laserTime;
}

//Delete Laser
if sprite_index == sLaserEnd then instance_destroy();