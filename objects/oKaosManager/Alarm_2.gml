///@desc Create Enemy Card

//Get Card
var _card = ds_list_find_value(enemyActions,enemyCard);

//Create Card
if _card != undefined
{
    instance_create_layer(room_width/2,-sprite_get_height(sBlankCard),"Cards",oAttackCard,{
        card : _card,
        targetX : getXPos(enemyCard),
        targetY : yOffset
    });
}

//Goto Next
enemyCard ++;

//Keep Going
if enemyCard < 3 then alarm[2] = 30;