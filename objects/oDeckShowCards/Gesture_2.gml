///@desc Grab Card Mobile
if canGrab and !global.holdingCard and !grabbed and !global.midTrans and global.mobile
{
    //Set Right Position
    x = cardX;
    y = cardY;
    
    //Offset
    offsetX = mouse_x - x;
    offsetY = mouse_y - y;
    
    //Set Grab
    grabbed = true;
    global.holdingCard = true;
}