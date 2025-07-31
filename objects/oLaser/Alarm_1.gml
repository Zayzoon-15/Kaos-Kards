///@desc Damage Target

//Action
action();

//Start Time Again
if !laserDone
{
    alarm[1] = delayTime;
} else {
    //Set Sprite
    sprite_index = sLaserEnd;
    
    //Set Shake
    targetShakePower = 0;
}
