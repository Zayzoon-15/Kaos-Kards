if touchingMouse()
{
    //Pressed
    if mouse_check_button_pressed(mb_left) and !pressed
    {
        pressed = true;
        
        image_speed = 1;
    }
    
    //Release
    if mouse_check_button_released(mb_left) and pressed
    {
        pressed = false;
        doAction = true;
    }
    
    
} else pressed = false;

//Set Image
if image_index >= 3 and pressed
{
    image_index = 3;
}


//Do Action
if doAction and image_index >= 4 {
    
    //Action
    with oDBContainer
    {
        ascendOrder = !ascendOrder;
        createCards();
    }
    
    //Rotate
    var _startRot = !oDBContainer.ascendOrder ? 0 : 180;
    TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,40,"arrowAngle",_startRot,_startRot+180);
    
    //Reset
    doAction = false;
}


//Update Text Offset
switch (image_index) {
	case 0: arrowYOffset = 0; arrowScaleOffset = 0; break;
	case 1: arrowYOffset = 1; break;
	case 3: arrowYOffset = 6; arrowScaleOffset = .15; break;
	case 4: arrowYOffset = 0; arrowScaleOffset = 0; break;
	case 5: arrowYOffset = 1;
}