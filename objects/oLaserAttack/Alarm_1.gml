///@desc Damage Target

//Action
if !beamClash then action();

//Start Time Again
if !laserDone
{
    alarm[1] = delayTime;
} else {
    //Set Sprite
    sprite_index = sLaserEnd;
    
    //Set Shake
    card.cardSetShake(0);
}
