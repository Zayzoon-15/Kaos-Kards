/// @desc  AFTER RANGE ACTIONS ////

//This is where all actions for after the range is finalized is done

/* HOW TO
 * All functions should look like this
 * function actionAfterRange(_playerCard,_curValue,_card)
 * 
 * ALL FUNCTIONS MUST RETURN A FINAL RANGE
 * var _myFinalRange = 3;
 * return _myFinalRange;
*/




function actionAfterRangeBurger(_playerCard,_curValue,_card)
{ 
    //Get Uses
    var _targetArray = _playerCard ? "Player ": "Enemy";
    var _uses = checkCardUses(actionCards.burger.name,_targetArray);
    
    //Change Range
    print("Old Burg Value",_curValue);
    var _finalRange = ceil(_curValue - _uses*irandom_range(4,7));
    print("New Burg Value",_finalRange);
    
    //Juice
    if _card != noone
    {
        with _card
        {
            cardJuice();
        }
    }

    //Sound
    audioPlaySfx(snCardValue,.95,1.05);
    
    //Return
    return _finalRange;
}