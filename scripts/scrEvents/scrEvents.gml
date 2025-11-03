
///@desc This event plays when the next round starts
function nextRoundStarted()
{
	//Reduce Assist Effects
	reduceAssEffects(10,true);
	reduceAssEffects(10,false);
	
	//Reset Mult
	global.valueMult = 1;
}

///@desc Plays when the played kaos card is complete
function kaosCardDone()
{
    //Destroy Kaos Card
    with oAttackCard
    {
        if card.info.type == CARDTYPES.KAOS
        {
            //Stars
            starEffect(x,y,10,20,25);
            
            //Destroy
            instance_destroy();
        }
    }
    
    //Next Kaos
    oKaosManager.alarm[0] = 50;
}