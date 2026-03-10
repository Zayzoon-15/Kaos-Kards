///@desc Fade Out

image_alpha -= .15;

//Destroy
if image_alpha <= 0
{
    instance_destroy();
} else alarm[0] = 8;