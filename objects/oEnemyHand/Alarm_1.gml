///@desc Enemy Hand



with oEnemyCard
{
    if cardId == other.currentCard
    {
        //Add To List
        var _struct = {
            cardInfo : {info:cardInfo,slotPlacement:cardId+1,sprite:sprite_index},
            cardAction : cardAction,
            value : currentRange
        };
        
        
        ds_list_add(enemiesActions,_struct);
    }
}

currentCard ++;

if currentCard != 3
{
    alarm[1] = 2;
}

