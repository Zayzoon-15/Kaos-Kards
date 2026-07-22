//Set Hover
if touchingMouse()
{
    if !hover
    {
        //Play Sound
        audioPlaySfx([snPaperHover1,snPaperHover2,snPaperHover3],.95,1.05,.3);
        
        //Set Hover
        hover = true;
    }
    
    //Press
    if mouse_check_button_pressed(mb_left)
    {
        audioPlaySfx(snBoo,2,2.2);
        pressed = true;
    }
    
    //Action
    if mouse_check_button_released(mb_left) and pressed
    {
        action();
    }
    
} else {
    hover = false;
    pressed = false;
}