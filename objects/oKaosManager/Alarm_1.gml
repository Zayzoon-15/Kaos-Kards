///@desc Create Player Card

//Get Card
var _card = ds_list_find_value(playerActions,playerCard+1);
var _nextCard = ds_list_find_value(playerActions,playerCard+2);

//Create Card
if _card != undefined and _card != 0
{
    //Change Value
    _card.value *= global.valueMult;
    
    instance_create_layer(room_width/2,room_height+sprite_get_height(sCardBlank),"Cards",oAttackCard,{
        card : _card,
        targetX : getXPos(playerCard),
        targetY : room_height - yOffset,
        targetEnemy : true,
        cardId : playerCard
    });
}

//Goto Next
playerCard ++;

//Get Speed
var _speed = 70;
if _nextCard != undefined and _nextCard != 0 and _nextCard != NaN
{
    _speed = _nextCard.info.showSpd * global.cardsSpeed.player;
}

//Keep Going
if playerCard < 3 then alarm[1] = _speed; else alarm[3] = 250;