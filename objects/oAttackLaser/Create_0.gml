
//Start Animation
sprite_index = sLaserStart;

//Shake
laserShake = 0;
shakeX = 0;
shakeY = 0;

//Hurt
hurting = false;
value = round(value);

//Laser Time
laserTime = 60*3;
alarm[0] = laserTime;

//Laser Angle
if target == "Enemy"
{
    image_angle = 0;
} else {
    image_angle = 180;
}