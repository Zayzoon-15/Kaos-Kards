///@desc Create Enemy Card

//Get Card
var _card = ds_list_find_value(enemyActions,enemyCard+1);

//Create Card
if _card != undefined and _card != 0
{
    instance_create_layer(room_width/2,-sprite_get_height(sCardBlank),"Cards",oAttackCard,{
        card : _card,
        targetX : getXPos(enemyCard),
        targetY : yOffset,
        targetEnemy : false,
		cardId : enemyCard
    });
}

//Goto Next
enemyCard ++;

//Keep Going
if enemyCard < 3 then alarm[2] = timeBetweenCards;