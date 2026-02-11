//Set List Values
listW = sprite_width;
listH = array_length(items) * itemH;

//Touching Drop Down
if point_in_rectangle(mouse_x,mouse_y,bbox_right-listW,bbox_bottom,bbox_right,bbox_bottom+listH) and open
{
    //Hover
    hover = (mouse_y - bbox_bottom) div itemH;
    
    //Click
    if mouse_check_button_pressed(mb_left)
    {
        pressedItem = true;
        lastHover = hover;
    }
    
    //Not Hovering
    if hover != lastHover then pressedItem = false;
    
    //Released
    if mouse_check_button_released(mb_left) and pressedItem
    {
        //Set Vars
        selected = hover;
        open = false;
        
        //Do Function
        items[selected].action();
    }
    
} else {
    hover = undefined;
    pressedItem = false;
    
    //Open Menu
    if !open
    {
        if touchingMouse()
        {
            if mouse_check_button_pressed(mb_left)
            {
                pressed = true;
            }
            
            if mouse_check_button_released(mb_left) and pressed
            {
                image_speed = 1;
                open = true;
                pressed = false;
            }
        } else pressed = false;

    }
    
    //Close Menu
    if open
    {
        if mouse_check_button_pressed(mb_left)
        {
            pressed = true;
        }
        
        if mouse_check_button_released(mb_left) and pressed
        {
            open = false;
            pressed = false;
        }
    }
}

//Open Animation
var _animSpd = 0.08;
if open
{
    animPos += _animSpd;
    
    if image_index >= 3
    {
        image_index = 3;
    }
    
} else animPos -= _animSpd;

//Play Animation
animPos = clamp(animPos,0,1);
listScale = animGetValue(acDropMenu,animPos);

//Update Text Offset
switch (image_index) {
	case 0: textYOffset = 0; textScaleOffset = 0; break;
	case 1: textYOffset = 1; break;
	case 3: textYOffset = 6; textScaleOffset = .15; break;
	case 4: textYOffset = 0; textScaleOffset = 0; break;
	case 5: textYOffset = 1;
}