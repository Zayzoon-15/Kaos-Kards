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
        //Animate
        with oDBSort {TweenEasyScale(1,1,0,0,0,10,EaseInBackSoft);}
        with oDBSortDropDown {TweenEasyFade(1,0,0,10,EaseOutCubic);}
        with oDBSortArrow {TweenEasyFade(1,0,0,10,EaseOutCubic);}
        TweenEasyFade(1,0,0,10,EaseOutCubic);
        
        //Set Pressed
        pressed = false;
        doAction = true;
    }
    
    
} else pressed = false;

//Set Image
if image_index >= 3 and pressed
{
    image_index = 3;
}

//Update Text Offset
switch (image_index) {
	case 0: textYOffset = 0; textScaleOffset = 0; break;
	case 1: textYOffset = 1; break;
	case 3: textYOffset = 6; textScaleOffset = .15; break;
	case 4: textYOffset = 0; textScaleOffset = 0; break;
	case 5: textYOffset = 1;
}

//Change Position
x = oDBSort.x + distX;
y = oDBSort.bbox_bottom + distY;