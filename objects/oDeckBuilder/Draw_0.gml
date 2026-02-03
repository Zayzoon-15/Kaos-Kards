draw_self();

//Draw Surface Sprite
if sprite != undefined
{
    //Fail Save (if screen is resized during transition)
    draw_set_colour(c_black);
    draw_rectangle(CAMERA_POS.x,CAMERA_POS.y,SCREEN_WIDTH,SCREEN_HEIGHT,false);
    draw_set_colour(c_white);
    
    //Draw Sprite
    gpu_set_blendenable(false);
    draw_sprite_ext(sprite,0,xOffset+spriteX,spriteY,spriteScale,spriteScale,0,c_white,1);
    gpu_set_blendenable(true);
}