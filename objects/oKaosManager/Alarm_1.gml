///@desc Create Player Card

//Get Card
var _card = ds_list_find_value(playerActions,playerCard);

//Create Card
if _card != undefined
{
    instance_create_layer(room_width/2,room_height+sprite_get_height(sBlankCard),"Cards",oAttackCard,{
        card : _card,
        targetX : getXPos(playerCard),
        targetY : room_height - yOffset
    });
}

//Goto Next
playerCard ++;

//Keep Going
if playerCard < 3 then alarm[1] = 30;