//Set Position
x = getPosToWindow(true);

//Press
if touchingMouse() and !global.menuOpen
{
    if mouse_check_button_pressed(mb_left)
    {
        pressed = true;
    }
    
    if mouse_check_button_released(mb_left) and pressed
    {
        //Get String
        var _array = isTip ? tips : funFacts;
        var _choice = _array[irandom_range(0,array_length(_array)-1)];
        
        //Create Bubble
        if !instance_exists(oBRThinkBubble){
            instance_create_layer(0,0,"Ui",oBRThinkBubble,{
                text : _choice
            });
        }
    }
    
} else pressed = false;

//Draw Info
drawTipBox(isTip ? "Click For A Tip" : "Click For A Fun Fact");