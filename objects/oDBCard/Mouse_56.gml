///@desc Let Go
if grabbed
{
    //Set Grab
    global.holdingCard = false;
    grabbed = false;
    
    //Insert In Hole
    if place_meeting(x,y,oDBInsertHole)
    {
        if room == rDeckBuilder1
        {
            //Max Cards Reached
            if global.deckCardAmount >= global.currentDeck.maxCards
            {
                createAlertMessage("MAX CARDS IN DECK",50,ROOM_CENTER.x,150);
                exit;
            }
            
            //Put In Deck
            array_push(playerDeck,info);
            global.deckCardAmount ++;
            
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
        } else {
        	
            //Remove From Deck
            var _index = array_get_index(playerDeck,info);
            array_delete(playerDeck,_index,1);
            global.deckCardAmount --;
            
            //Reorder Cards
            oDBDeck.lastCardId --;
            with oDBCard
            {
                if other.cardId < cardId
                {
                    rowId --;
                    if rowId <= 0
                    {
                        row --;
                        rowId = maxRow;
                    }
                
                    cardId --;
                }
            }
            
            //Destroy
            instance_destroy();
        }

    }
}