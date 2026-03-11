///@desc Let Go
if grabbed
{
    //Set Grab
    global.holdingCard = false;
    grabbed = false;
    
    //Insert In Hole
    if place_meeting(x,y,oDBInsertHole)
    {
        removeCard();
    }
}