//Click Item
if touchingMouse() and !global.menuOpen and !global.midTrans and canHover and !touchingMouse(oParButton)
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

//Stick To Screen
x = getPosToWindow(stickToRight);

//Draw Tipbox
if tipBox
{
    drawTipBox(tipBoxString,tipBoxTop,false,tipBoxDistance,tipBoxOffset);
}
