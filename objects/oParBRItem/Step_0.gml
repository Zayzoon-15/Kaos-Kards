//Click Item
if touchingMouse() and !global.menuOpen and canHover
{
    if mouse_check_button_pressed(mb_left)
    {
        pressed = true;
    }
    
    if mouse_check_button_released(mb_left) and pressed
    {
        action();
    }
} else pressed = false;

//Draw Tipbox
if tipBox
{
    drawTipBox(tipBoxString,tipBoxTop,false,tipBoxDistance,tipBoxOffset);
}
