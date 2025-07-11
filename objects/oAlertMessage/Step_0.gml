
//Fade
if lifeSpan <= 0
{
    if image_alpha > 0
    {
        image_alpha -= 0.03;
    } else instance_destroy();
} else lifeSpan --;
