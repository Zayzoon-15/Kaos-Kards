//Stick To Screen
x = global.stickItemsToScreen ? getPosToWindow(false) : xstart;

//Touching
if touchingMouse() and !global.menuOpen and !global.midTrans
{
    //Animate
    image_speed = 1;
    
    //Start Press
    if mouse_check_button_pressed(mb_left) then pressed = true;
    
    //Pressed
    if mouse_check_button_released(mb_left) and pressed
    {
        //Change Enemy
        global.currentEnemy = global.currentTourney.enemies[global.tourneyEnemiesBeaten];
        
        //Go To Room
        transStart(rPrepare);
        eventGameReset(false);
    }
    
} else {
    
    //Stop Animation
    if floor(image_index) == 0
    {
        image_speed = 0;
    }
    
    //Press
    pressed = false;
}
