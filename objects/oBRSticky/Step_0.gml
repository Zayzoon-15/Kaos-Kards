//Set Position
x = getPosToWindow(true);

//Press
if touchingMouse()
{
    if mouse_check_button_pressed(mb_left)
    {
        pressed = true;
    }
    
    if mouse_check_button_released(mb_left) and pressed
    {
        var _array = isTip ? tips : funFacts;
        var _choice = _array[irandom_range(0,array_length(_array)-1)];
        
        show_message(_choice);
    }
    
} else pressed = false;

//Draw Info
drawTipBox(isTip ? "Click For A Tip" : "Click For A Fun Fact");