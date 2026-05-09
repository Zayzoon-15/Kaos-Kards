//Stick To Screen
x = getPosToWindow(true);

//Update Scissor Value
updateScissorValue();

//Get Scroll Distance
maxScrollDist = 0;
with oParSettingsBtn
{
    if btnId == global.settingsBtnId-1
    {
        other.maxScrollDist = ystart - other.scissorStuct.h - 10;
        other.maxScrollDist = max(0,other.maxScrollDist);
    }
}

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
    if !mobileTouch and mouse_check_button_pressed(mb_left) and mouse_x >= 500 and mouse_x < scrollBoxRect.one.x - 5
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


//Scroll Bar
updateScrollBox(true);

if point_in_rectangle(mouse_x,mouse_y,scrollBoxRect.one.x,scrollBoxRect.one.y,scrollBoxRect.two.x,scrollBoxRect.two.y) and mouse_check_button_pressed(mb_left)
{
    scrollFollow = true;
}

if scrollFollow
{
    //Setup Vars
    var _scroll = 0;
    var _top = scrollBoxRect.one.y + (scrollBoxMargin/2 + scrollBoxH/2);
    var _bottom = scrollBoxRect.two.y - (scrollBoxMargin/2 + scrollBoxH/2);
    var _height = _bottom - _top
    
    //Change Value
	if mouse_y > _top
	{
        //Get Amount
		var _y = abs(_top-mouse_y);
		var _amount = _y / _height;
        
        //Set Amount
		_scroll = _amount * maxScrollDist;
        
	} else _scroll = 0;
    
    //Ease
    scroll = lerp(scroll,_scroll,.3);
    
    //Let Go
    if !mouse_check_button(mb_left)
    {
        //Stop Follow
        scrollFollow = false;
        
        //Accel
        scrollVel = (mouse_y - scrollBoxLastMouse.y) * .4;
    }
    
    //Last Mouse Pos
    scrollBoxLastMouse = new Vector2(mouse_x,mouse_y);
}


////Scroll Bounce On Edge
//if scroll < 0
//{
    //scroll *= 0.5;
    //scrollVel *= 0.5;
//}
//
//if scroll > maxScrollDist
//{
    //var _over = scroll - maxScrollDist;
    //scroll = maxScrollDist + _over * 0.5;
    //scrollVel *= 0.5;
//}

//Clamp Scroll
scroll = clamp(scroll,0,maxScrollDist);


//Update Button Ui
with oParSettingsBtn
{
    targetY = -other.scroll;
}