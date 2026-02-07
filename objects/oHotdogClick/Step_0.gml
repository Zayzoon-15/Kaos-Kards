if point_in_circle(mouse_x,mouse_y,x,y,maxRad) and mouse_check_button_pressed(mb_left)
{
    //Checked if Other Clicked
    with oHotdogClick
    {
        if id != other.id and point_in_circle(mouse_x,mouse_y,x,y,maxRad) and mouse_check_button_pressed(mb_left)
        {
            if depth > other.depth
            {
                other.canClick = false;
            } else canClick = false;
        }
    }
    if !canClick then exit;
    
    //Set Guy To Eat
    with oHotdogGuy {
    	if playerId == 0
        {
            eatFood();
        }
    }
    
    //Destroy
    effectStar(x,y,5);
    instance_destroy();
}

//Decrease Radius
rad -= 0.2;

//Destroy
if rad <= 0
{
    with oHotdogGuy {
    	if playerId == 0
        {
            missedFood();
        }
    }
    instance_destroy();
}

canClick = true;