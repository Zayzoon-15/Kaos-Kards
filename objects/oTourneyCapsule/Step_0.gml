
//Set Position
var _id = capsuleId - oTourneySelector.selectedCapsule;
var _offset = 13;
var _x = abs(round(_id)) > 2 ? centerPos.x - (_offset * abs(abs((_id))-3)) : centerPos.x + (_offset * abs((_id)));
var _y = centerPos.y + 176 * _id;
x = lerp(x,_x,.2);
y = lerp(y,_y,.2);

//Set Selected
selected = capsuleId == round(oTourneySelector.selectedCapsule);


//Set Correct Sprite
image_index = selected;

//Press
if touchingMouse()
{
    if mouse_check_button_pressed(mb_left) and !oTourneySelector.dragging
    {
        pressed = true;
    }
    
    if mouse_check_button_released(mb_left) and pressed and !oTourneySelector.dragging
    {
        oTourneySelector.lastSelectionScroll = capsuleId;
        oTourneySelector.selectedCapsule = capsuleId;
        selected = true;
        
        pressed = false;
    }
    
} else {
	pressed = false;
}

//Change Toruney
if selected
{
    global.currentTourney = info;
}