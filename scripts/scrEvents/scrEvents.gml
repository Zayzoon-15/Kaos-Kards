
///@desc This event plays when the player resets the match
function gameReset()
{	
	//Set Gamestate
	gameState = GAMESTATES.PREPARE;
	
    //Reset Round
    global.gameRound = 0;
    
    //Reset Uses
    global.enemySpecialUses = 0;
    
	//Destroy All Effects
	instance_destroy(oAttackEffect);
	instance_destroy(oHealthIcon);
	ds_list_clear(playerEffects);
	ds_list_clear(enemyEffects);
	
	//Reset Combo
	global.playerComboMeter = 0;
	global.enemyComboMeter = 0;
	
	//Reset Health Bar
	global.playerHp = 100;
	global.playerTempHp = 100;
	global.playerHpIcons = [];
	global.enemyHp = 100;
	global.enemyTempHp = 0;
	global.enemyHpIcons = [];
	
	//Remove Actions
	ds_list_clear(playerActions);
	ds_list_clear(enemyActions);
	
	//Reset Mult
	global.valueMult = 1;
	
	//Reset Slots
    global.disabledSlots = {
        player: array_create(4,false),
        enemy : array_create(4,false)
    };
    
    //Removed
    global.playerRemovedCards = [];
    global.enemyRemovedCards = [];
    global.playerAddCards = [];
    global.enemyAddCards = [];
}


///@desc This event plays when the next round starts
function nextRoundStarted()
{
    //Set Gamestate
    gameState = GAMESTATES.PREPARE;
    
    //Increase Round
    global.gameRound ++;
    print("Game Round",global.gameRound)
    
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
	if instance_exists(oKaosManager) then oKaosManager.alarm[0] = 50;
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
    if instance_exists(oKaosManager) then oKaosManager.alarm[5] = 50;
}