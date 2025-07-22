

///@self oAttackCard
function slashAction(_card,_targetEnemy)
{
    //Juice
    _card.cardShake();
    
    //Create Sword
    instance_create_layer(_card.x,_card.y,"Attacks",oSlash,{
        targetEnemy : _targetEnemy,
        value : _card.value
    });
    
}


///@self oAttackCard
function healAction(_card,_targetEnemy)
{
    //Juice
    _card.cardJuice(false);
    var _healX = (_card.sprite_width/2)-10;
    var _healY = (_card.sprite_height/2)-25;
    healthEffect(_card.x,_card.y,10,-_healX,_healX,-_healY,_healY);
    numberEffect(_card.x,_card.y,_card.value);
    
    //Give Health
    if _targetEnemy
    {
        healPlayer(_card.value);
    } else healEnemy(_card.value);
}


///@self oAttackCard
function shieldAction(_card,_targetEnemy)
{
    //Juice
    _card.cardShake();
    
    //Effect
    instance_create_layer(_card.x,_card.y,"Attacks",oShield,{
        value : _card.value
    });
    
    //Give Temp Health
    if _targetEnemy
    {
        global.playerTempHp += _card.value;
    } else global.enemyTempHp += _card.value;
}