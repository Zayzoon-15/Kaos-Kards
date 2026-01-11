//Stick To Screen
x = getPosToWindow(true);

//Update Scissor Value
updateScissorValue();

//Get Scroll Distance
var _maxScrollDist = 0;
with oParSettingsBtn
{
    if btnId == global.settingsBtnId-1
    {
        _maxScrollDist = ystart - other.scissorStuct.h -10;
        _maxScrollDist = max(0,_maxScrollDist)
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
    if !mobileTouch and mouse_check_button_pressed(mb_left) and mouse_x >= 500
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

////Scroll Bounce On Edge
//if (scroll < 0)
//{
    //scroll *= 0.5;
    //scrollVel *= 0.5;
//}
//
//if (scroll > _maxScrollDist)
//{
    //var _over = scroll - _maxScrollDist;
    //scroll = _maxScrollDist + _over * 0.5;
    //scrollVel *= 0.5;
//}

//Clamp Scroll
scroll = clamp(scroll,0,_maxScrollDist);


//Update Button Ui
with oParSettingsBtn
{
    targetY = -other.scroll;
}