///@desc Grab Card

if canGrab and !global.holdingCard and gamestate == GAMESTATE.PREPARE and oDeck.finishedDrawing
{
    offsetX = mouse_x - x;
    offsetY = mouse_y - y;
    
    
    if state == CARDSTATE.HAND
    {
        ds_list_delete(playerHand,cardId);
        
        with oCard
        {
            if cardId > other.cardId
            {
                cardId --;
            }
        }
    }
    
    var _sound = asset_get_index($"snButtonHover{irandom_range(1,2)}");
    audio_play_sound(_sound,0,false);
    
    global.holdingCard = true;
    
    state = CARDSTATE.GRABBED;
    canGrab = false;
}