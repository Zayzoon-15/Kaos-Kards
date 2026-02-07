/////////////////////////
//// DICE ACTIONS ////
///////////////////////

//This is where all dice card actions go

/* HOW TO
 * All functions should look like this
 * function action(_info,_card,[_dice]) -> You can put in more info such as dice but it is not required
*/



///@self oCard
function diceCardSwapDice(_info,_card,_dice)
{	
    //Check If Dice Done
    if instance_exists(oDice)
    {
        _card.canPlace = !oDice.diceFullyDone;
    }
    
    
    //Swap Dice
    if _card.state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == _card.targetDice and dice != _dice
            {
                dice = _dice;
                diceJuice();
            }
        }
    } else { //Change Dice Back
        with oDice
        {
            if diceId == _card.targetDice and dice != diceTypes.d6 and _card.wasOnSlot
            {
                dice = diceTypes.d6;
                diceJuice();
                _card.wasOnSlot = false;
            }
        }
    }
    
    //Can Grab
    if _card.state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == 3
            {
                if rolling
                {
                    _card.canMove = false;
                }
                
                if rollDone
                {
                    //Add To Uses
                    array_push(global.cardUses.player,_card.info.name);
                    print(global.cardUses.player);
                    
                    //Destroy Card
                    _card.slot.used = true;
					effectStar(_card.x,_card.y,10);
                    instance_destroy(_card);
                }
            }
        }
    }
}


///@self oCard
function diceCardReroll(_info,_card)
{	
    //Check If Dice Done
    if instance_exists(oDice)
    {
        _card.canPlace = oDice.diceFullyDone;
    }
    
    //Reroll
    if _card.state == CARDSTATE.PLACED and !oRollButton.canHover
    {
        oRollButton.canHover = true;
    }
    
    if _card.wasOnSlot and oRollButton.canHover and _card.state != CARDSTATE.PLACED
    {
        oRollButton.canHover = false;
        _card.wasOnSlot = false;
    }
}


function diceCardScrewUp(_info,_card)
{
    //Check If Dice Done
    if instance_exists(oDice)
    {
        _card.canPlace = !oDice.diceFullyDone;
    }
    
    //Don't Move
    with oDice
    {
        if diceId == 3
        {
            if rolling then _card.canMove = false;
        }
    }
    
    //Do Action
    if _card.state == CARDSTATE.PLACED and oDice.diceFullyDone
    {
        //Check Dice
        var _amount = 0;
        with oDice
        {
            if diceNum >= dice.range.max/2
            {
                _amount ++;
            }
        }
        
        //Set Dice
        with oDice
        {
            //Set Number
            if _amount >= 3
            {
                diceNum = dice.range.max;
            } else diceNum = 0;
            
            //Juice
            diceJuice(diceId == 3);
        }
        
        //Destroy Card
        _card.slot.used = true;
        effectStar(_card.x,_card.y,10);
        instance_destroy(_card);
    }
    
}