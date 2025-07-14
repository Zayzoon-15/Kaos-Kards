///@desc Create Kaos Card

//Create Card
var _createKaos = function(_card,_y)
{
    instance_create_layer(room_width/2,_y,"Cards",oAttackCard,{
    card : _card,
    targetX : room_width/2,
    targetY : room_height/2
    });
}

//Play Players Card
if (playerFirst or enemyKaos == undefined) and playerKaos != undefined
{
    //Create Card
    _createKaos(playerKaos,room_height+sprite_get_height(sBlankCard));
    
    //Reset Kaos
    playerKaos = undefined;
    alarm[0] = 30;
}


//Play Enemies
if (!playerFirst or playerKaos == undefined) and enemyKaos != undefined
{
    //Create Card
    _createKaos(enemyKaos,-sprite_get_height(sBlankCard));
    
    //Reset Kaos
    enemyKaos = undefined;
    alarm[0] = 30;
}

//Play Normal Cards
if enemyKaos == undefined and playerKaos == undefined
{
    alarm[1] = 60;
    alarm[2] = 60;
}