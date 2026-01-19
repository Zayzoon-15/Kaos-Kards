///@desc Let Go
if grabbed
{
    //Set Grab
    global.holdingCard = false;
    grabbed = false;
    
    //Inster In Hole
    if place_meeting(x,y,oDBInstertHole)
    {
        show_message("ME HOLE")
    }
}