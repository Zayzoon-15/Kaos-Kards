///@desc Let Go
if grabbed
{
    //Set Grab
    global.holdingCard = false;
    grabbed = false;
    
    //Insert In Hole
    if place_meeting(x,y,oDBInsertHole)
    {
        //Put In Deck
        array_push(playerDeck,info);
        
        //Exit Animation
        var _coolAnim = true;
        
        //Create Card Again
        var _inst = instance_create_depth(targetX,targetY,startDepth,oDBCard,{
            info : info,
            scrollOffset : scrollOffset
        });
        _inst.xstart = xstart;
        _inst.ystart = ystart;
        
        //Destroy
        instance_destroy();
        
        //Print
        print("Added",info.name);
        print("FULL DECK",playerDeck);
    }
}