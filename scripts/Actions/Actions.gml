/////////////////////////
//// ATTACK ACTIONS ////
///////////////////////

//This is where all action card attacks go

/* HOW TO
 * All functions should look like this
 * function action(_card,_targetEnemy)
*/



///@self oAttackCard
function healAction(_card,_targetEnemy)
{
    //Juice
    _card.cardJuice(false);
    healthEffect(_card.x,_card.y,10,10,25,sprite_get_width(sBlankCard),sprite_get_height(sBlankCard));
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
        value : _card.value,
        card : _card
    });
    
    //Give Temp Health
    addEffect(attackEffects.shield,_card.value,!_targetEnemy);
}


///@self oAttackCard
function slashAction(_card,_targetEnemy)
{
    //Juice
    _card.cardShake();
    
    //Create Sword
    instance_create_layer(_card.x,_card.y,"Attacks",oSlashAttack,{
        targetEnemy : _targetEnemy,
        value : _card.value,
        card : _card
    });
    
}


///@self oAttackCard
function breadAction(_card,_targetEnemy)
{
    //Create Bread
    instance_create_layer(_card.x,_card.y,"Attacks",oBreadAttack,{
        targetEnemy : _targetEnemy,
        value : _card.value,
        breadId : 1,
        card : _card
    });
}


///@self oAttackCard
function laserAction(_card,_targetEnemy)
{
    instance_create_layer(_card.x,_card.y,"Attacks",oLaserAttack,{
        targetEnemy : _targetEnemy,
        value : _card.value,
        card : _card
    });
}


///@self oAttackCard
function punchAction(_card,_targetEnemy)
{
    instance_create_layer(_card.x,_card.y,"Attacks",oFistAttack,{
        targetEnemy : _targetEnemy,
        value : _card.value,
        card : _card
    });
}


///@self oAttackCard
function poisonAction(_card,_targetEnemy)
{
    //Juice
    _card.cardJuice(false);
    
    //Apply Poison
    addEffect(attackEffects.poison,_card.value,_targetEnemy);
}

///@self oAttackCard
function flameAceAction(_card,_targetEnemy)
{
	//Juice
	_card.cardJuice(false);
	
    //Create Ace
    instance_create_layer(_card.x,_card.y,"Attacks",oFlameAceAttack,{
        targetEnemy : _targetEnemy,
        value : _card.value,
        card : _card
    });
}

