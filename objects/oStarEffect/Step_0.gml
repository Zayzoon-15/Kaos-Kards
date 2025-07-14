//Spin
image_angle += spinSpd;

//Fade
if life > lifespan
{
    image_alpha -= .05;
} else life += 1;

//Destroy
if image_alpha < 0 then instance_destroy();