//Update
updateScissorValue();



//Set Scroll Distance
maxScroll = max(0,maxScroll);

//Pc Scroll
if !global.mobile
{
    //Get Direction
    var _dir = mouse_wheel_down() - mouse_wheel_up();
    
    if _dir != 0
    {
        //Add Scroll
        scroll += _dir * pcScrollStep;
        
        //Momentum For Flicks
        scrollVel += _dir * pcScrollMomentum;
    }
} else if mobileCanDrag { //Mobile Scroll
    
    //Drag start
    if !mobileTouch and mouse_check_button_pressed(mb_left) and !touchingMouse(oDBCard)
    {
        mobileTouch = true;
        mobileTouchLast = device_mouse_y_to_gui(0);
        scrollVel = 0;
    }
    
    //Dragging
    if mobileTouch and mouse_check_button(mb_left)
    {
        //Get Values
        var _y = device_mouse_y_to_gui(0);
        var _dy = _y - mobileTouchLast;
        
        //Scroll
        scroll -= _dy * mobileScrollDrag;
        mobileTouchVel = _dy;
        
        //Set Touch last
        mobileTouchLast = _y;
    }

    //Drag Release
    if mobileTouch and mouse_check_button_released(mb_left)
    {
        scrollVel = -mobileTouchVel;
        mobileTouch = false;
    }
}

//Clamp Scroll Velocity
scrollVel = clamp(scrollVel, -scrollMaxVel, scrollMaxVel);

//Apply Velocity If Not Dragging
if !mobileTouch
{
    scroll += scrollVel;
    scrollVel *= scrollFriction;
}

//Clamp Scroll
scroll = clamp(scroll,0,maxScroll);

//Update Cards
with oDBCard
{
    scrollOffset = -other.scroll;
}