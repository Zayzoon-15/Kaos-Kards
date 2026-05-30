///@desc Grab Card
if canGrab and !global.holdingCard
{
    //Offset
    offsetX = mouse_x - x;
    offsetY = mouse_y - y;
    
    //Remove Card
    hover = false;
    
    //Set Grab
    canGrab = false;
    global.holdingCard = true;
    
    //Set State
    grabbed = true;
    
}