//Set Position
x = getPosToWindow(true);

//Mouse Hover
if !touchingMouse()
{
    //Rotate
    if touched and !wasGrabbed
    {
        angleVel += (mouse_x - lastMouseX)*mouseDrag;
        touched = false;
    }
    
    if !grabbed
    {
        touched = false;
        wasGrabbed = false;
    }
    
} else if canHover {
	
    //Set Touched
    touched = true;
    
    //Set Last Mouse
    lastMouseX = mouse_x;
    
    //Grab
    if mouse_check_button_pressed(mb_left)
    {
        grabbed = true;
    }
}

//Grab
if grabbed
{
    //Rotate Based On Mouse
    var _dir = point_direction(x,y,mouse_x,mouse_y);
    var _targetAngle = angle_difference(_dir,270);
    var _diff = angle_difference(_targetAngle,image_angle);
    angleVel = _diff;
    
    //Can Hover
    canHover = false;
    global.holdingCard = true;
    
    //Let Go
    if !mouse_check_button(mb_left)
    {
        grabbed = false;
        canHover = true;
        global.holdingCard = false;
    }
    
} else {
	//Rotate Normally
    var _diff = angle_difference(0, image_angle);
    var _force = -image_angle * stiffness;
    angleVel += _diff * stiffness;
}

//Damp Rotation
angleVel *= damping;
image_angle += angleVel;

//Clamp Angle
image_angle = clamp(image_angle,-120,120);

//Draw Info
drawTipBox(tipInfo);