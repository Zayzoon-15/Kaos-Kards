//Mouse
hover = false;
pressed = false;



//Function
action = function()
{
    //Switch Based On Sprite
    switch (sprite_index) {
    	
        case sTourneyReady:
            transStart(rBreakRoom);
            eventGameReset(true);
        break;
    	
        case sTourneyDb:
            transStart(rDeckBuilder1);
        break;
        
    }
}

