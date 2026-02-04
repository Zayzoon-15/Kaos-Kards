//Apply Gravity
yspd += grav * DELTA_TIME;

//Apply Speeds
x += xspd * DELTA_TIME;
y += yspd * DELTA_TIME;

//Spin
image_angle += spinSpd * DELTA_TIME;

//Fade
if fade
{

	//Check Life Span
	if life > lifespan
	{
	    image_alpha -= .05*DELTA_TIME;
	} else life += 1*DELTA_TIME;

	//Destroy
	if image_alpha < 0 then instance_destroy();

}