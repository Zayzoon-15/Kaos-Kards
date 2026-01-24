///@desc Let Go
if grabbed
{
    //Set Grab
    global.holdingCard = false;
    grabbed = false;
    
    //Inster In Hole
    if place_meeting(x,y,oDBInstertHole)
    {
        //Put In Deck
        array_push(playerDeck,info);
        
        //Exit Animation
        var _coolAnim = true;
        
        //Create Animation
        explosionEffect(targetX,targetY,true,2.5);
        
        //Create Card Again
        timeSourceCreate(20,instance_create_depth,[targetX,targetY,startDepth,oDBCard,{
            info : info
        }],time_source_units_frames);
        
        //Destroy
        instance_destroy();
        
        //Print
        print("Added",info.name);
        print("FULL DECK",playerDeck);
    }
}