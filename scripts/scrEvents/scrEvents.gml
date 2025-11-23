
///@desc This event plays when the next round starts
function nextRoundStarted()
{
    //Set Gamestate
    gameState = GAMESTATES.PREPARE;
    
    //Remove Actions
    ds_list_clear(playerActions);
    ds_list_clear(enemyActions);
    
	//Reduce Assist Effects
	reduceAssEffects(10,true);
	reduceAssEffects(10,false);
	
	//Reset Mult
	global.valueMult = 1;
}

///@desc This event plays when the kaos part of the match starts
function kaosRoundStarted()
{
    //Set Gamestate
    gameState = GAMESTATES.KAOS;
    
    //Reset Slots
    global.disabledSlots = {
        player: array_create(4,false),
        enemy : array_create(4,false)
    };
}

///@desc This event plays when the played kaos card is complete
function kaosCardDone()
{
    //Destroy Kaos Card
    with oAttackCard
    {
        if card.info.type == CARDTYPES.KAOS
        {
            //Stars
            starEffect(x,y,10,true,20,25);
            
            //Destroy
            instance_destroy();
        }
    }
    
    //Next Kaos
    oKaosManager.alarm[0] = 50;
}

///@desc This event plays when the played combo attack is complete
function comboAttackDone()
{
    //Destroy Kaos Card
    with oAttackCard
    {
        if combo
        {
            //Stars
            starEffect(x,y,10,true,20,25);
            
            //Destroy
            instance_destroy();
        }
    }
    
    //Next Kaos
    oKaosManager.alarm[5] = 50;
}