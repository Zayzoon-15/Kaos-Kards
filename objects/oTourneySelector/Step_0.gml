//Set Position
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

//Menu Open
if global.menuOpen then exit;

#region Scrolling

//Set Scrolling
scrolling = mouse_wheel_up() or mouse_wheel_down();

//Mouse Scrolling
if mouse_wheel_up() then selectedCapsule -= .6;
if mouse_wheel_down() then selectedCapsule += .6;

#region Keyboard Scrolling

//Move Up
if (keyCheckPressed(global.keyMoveUp) or keyCheckPressed(vk_up)) or (keyHeld == global.keyMoveUp and keyHoldFrames >= keyHoldTime)  {
    //Change Selected
    selectedCapsule --;
    
    //Loop
    if selectedCapsule < 0 then selectedCapsule = totalCapsules;
    
    //Set Last Scroll
    lastSelectionScroll = selectedCapsule;
    
    //Reduce Frames
    keyHoldFrames -= 10;
}

//Move Down
if (keyCheckPressed(global.keyMoveDown) or keyCheckPressed(vk_down)) or (keyHeld == global.keyMoveDown and keyHoldFrames >= keyHoldTime) {
    //Change Selected
    selectedCapsule ++;
    
    //Loop
    if selectedCapsule > totalCapsules then selectedCapsule = 0;
    
    //Set Last Scroll
    lastSelectionScroll = selectedCapsule;
    
    //Reduce Frames
    keyHoldFrames -= 10;
}

//Key Held Down For Fast Scrolling
if keyCheckHeld(global.keyMoveUp) or keyCheckHeld(vk_up)
{
    if keyHeld != global.keyMoveUp
    {
        keyHoldFrames = 0;
        keyHeld = global.keyMoveUp;
    }
    
    keyHoldFrames += 1;
}

if keyCheckHeld(global.keyMoveDown) or keyCheckHeld(vk_down)
{
    if keyHeld != global.keyMoveDown
    {
        keyHoldFrames = 0;
        keyHeld = global.keyMoveDown;
    }
    
    keyHoldFrames += 1;
}

#endregion

//Set Selected Capsule
if !scrolling and !dragging
{
    selectedCapsule = lerp(selectedCapsule,lastSelectionScroll,.4);
} else {
    lastSelectionScroll = round(selectedCapsule);
}

//Clamp Selected Capsules
selectedCapsule = clamp(selectedCapsule,0,totalCapsules);

#endregion


