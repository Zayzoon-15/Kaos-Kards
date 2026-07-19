//Hover
if touchingMouse()
{
    
    
    if mouse_check_button_pressed(mb_left) {
        pressed = true;
        squash(1.2,.8);
    }
    
    if mouse_check_button_released(mb_left) and pressed {
        
        if image_index == 0 {
            oTourneyMenu.changeTourney(-1);
        } else oTourneyMenu.changeTourney(1);
        
        
    }
    
} else {
	pressed = false;
}

//Ease Scale
xscale = lerp(xscale,targetScale,.2);
yscale = lerp(yscale,targetScale,.2);
