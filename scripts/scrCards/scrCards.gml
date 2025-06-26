
function diceCardSetup()
{
    if state == CARDSTATE.PLACED
    {
        with (oDice) {
        	if diceId == other.targetDice
            {
                if diceType != other.diceChange
                {
                    diceType = other.diceChange;
                    diceJuice();
                }
                
            }
        }
    }
    
    if wasPlaced and state != CARDSTATE.PLACED
    {
        with (oDice) {
        	if diceId == other.targetDice
            {
                diceType = 6;
            }
        }
    }
    
    with oDice
    {
        if rolling and other.state == CARDSTATE.PLACED
        {
            other.canGrab = false;
        }
    }
    
    
    with oDice
    {
        if diceId == 3 and gamestate == GAMESTATE.PREPARE
        {
            if rollDone and other.state == CARDSTATE.PLACED
            {
                other.slot.used = true;
                starEffect(other.x,other.y,10);
                instance_destroy(other);
            }
        }
    }
    
    with oDice
    {
        if rolling or rollDone
        {
            other.canBePlaced = false;
        }
    }
}



function cardRewardGetInfo(_card)
{
    switch (_card) {
    	case oCardBread: return actionCardBread;
    	case oCardDestroy: return kaosCardDestroy;
    	case oCardDice12: return diceCard12;
    	case oCardDice20: return diceCard20;
    	case oCardDice8: return diceCard8;
    	case oCardDiceUpgrade: return diceCardUpgrade;
    	case oCardReroll: return diceCardReroll;
    	case oCardFlame: return actionCardFlame;
    	case oCardHeal: return actionCardHeal;
    	case oCardPoison: return actionCardPoison;
    	case oCardFreeze: return actionCardFreeze;
    	case oCardHigh: return kaosCardHigh;
    	case oCardLaser: return actionCardLaser;
    	case oCardShield: return actionCardShield;
    	case oCardSlash: return actionCardSlash;
    	case oCardSwap: return kaosCardSwap;
    	case oCardWheat: return kaosCardWheat;
        case oCardFist: return actionCardFist;
        case oCardIou: return actionCardIou;
    }
}