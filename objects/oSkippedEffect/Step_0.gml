//Fade
if life > lifespan
{
    image_alpha -= .03;
} else life += 1;

//Destroy
if image_alpha < 0 then instance_destroy();

//Ease
image_xscale = lerp(image_xscale,1,.3);
image_yscale = lerp(image_yscale,1,.3);