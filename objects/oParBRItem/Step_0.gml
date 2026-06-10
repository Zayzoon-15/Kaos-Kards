if touchingMouse() and !global.menuOpen and createBubbleOnClick
{
    if mouse_check_button_pressed(mb_left)
    {
        pressed = true;
    }
    
    if mouse_check_button_released(mb_left) and pressed
    {
        createBubble(bubbleText);
    }
} else pressed = false;