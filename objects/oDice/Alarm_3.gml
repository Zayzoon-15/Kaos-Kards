///@desc Combine With Card

with oCard
{
    if state == CARDSTATE.PLACED and cardInfo.type == "Action"
    {
        if slot.slotId == other.diceId
        {
            //Juice
            setSize(image_xscale+.5,image_yscale+.5);
            image_angle += choose(random_range(-10,-5),random_range(5,10));
            rangeTextSize += 1;
            starEffect(x,y,10);
            
            //Audio
            var _sound = asset_get_index($"snStars{irandom_range(1,2)}");
            audio_play_sound(_sound,0,false);
            
            //Add Range
            currentRange += other.diceNum;
            
            //Add To List
            var _struct = {
                cardInfo : {info:cardInfo,slotPlacement:slot.slotId,sprite:sprite_index},
                cardAction : cardAction,
                value : currentRange
            };
            
            ds_list_add(playersActions,_struct);
            
        }
    }
    
    if state == CARDSTATE.PLACED and cardInfo.type == "Chaos"
    {
        var _struct = {
            cardInfo : {info:cardInfo,sprite:sprite_index},
            cardAction : cardAction,
            value : currentRange
        }
        
        playerChaosCard = _struct;
    }
}

instance_destroy();