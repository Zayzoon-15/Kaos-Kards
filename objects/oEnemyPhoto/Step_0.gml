//Draw Info
drawTipBox(global.currentEnemy.name, false);

//Set To Right Side
x = getPosToWindow(true);

//Set Sprite
sprite_index = global.currentEnemy.sprite;

//Animate
if currentAnim != undefined
{
    //Update Frame
    frame += sprite_get_speed(sprite_index) / 60;
    
    //Animate
    if frame >= currentAnim.length
    {
        animationEnd = true;
    
        if currentAnim.loop
        {
            frame -= currentAnim.length;
        } else frame = currentAnim.length - 1;
    }
    
    //Apply Frame
    image_index = currentAnim.start + frame;  
}