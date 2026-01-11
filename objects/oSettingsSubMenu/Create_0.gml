//Set Scissor Value
scissorStuct = {x:0,y:0,w:0,h:0};
updateScissorValue = function()
{
    scissorStuct = {
        x : SCREEN_WIDTH-sprite_width-23, //MAGIC NUMBERS AAAAAAAAAAAAA ~_~
        y : bbox_top,
        w : bbox_right - bbox_left,
        h : bbox_bottom - bbox_top
    }
}

//Scroll
scroll = 0;
scrollVel = 0;

//Mobile
mobileTouch = false;
mobileTouchLast = 0;
mobileTouchVel = 0;
mobileCanDrag = true;

#region Scroll Tuning

scrollFriction = 0.88; //How Quickly Momentum Slows Down | Big = Stops Faster  Small = Glides Longer
scrollMaxVel = 70; //Max Speed

//PC
pcScrollStep = 5; //How Far The List Moves | Big = More sensitive
pcScrollMomentum = 12; //How Much Velocity Is Added On Mouse | Big = Wheel Flick Glides Further

//Mobile
mobileScrollDrag = 1.4; //Multiplier For Drag Movement | Big = Faster  Small = Slower

#endregion