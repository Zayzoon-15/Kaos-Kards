/////////////////////////
//// ATTACK ACTIONS ////
///////////////////////

//This is where all action card attacks go

/* HOW TO
 * All functions should look like this
 * function action(_targetEnemy)
*/



///@self oAttackCard
function actionHeal(_targetEnemy)
{
	//Buff Value
	var _value = value * 1.5;
	
    //Juice
    cardJuice(false);
    effectHealth(x,y,10,true,10,25,sprite_get_width(sCardBlank),sprite_get_height(sCardBlank));
    effectNumber(x,y,_value);
    
    //Give Health
    if _targetEnemy
    {
        healPlayer(_value);
    } else healEnemy(_value);
    
    //Play Voice
    audioPlayVoice([voiceInfo.healAnymore,voiceInfo.healMid],false,3);
}


///@self oAttackCard
function actionShield(_targetEnemy)
{
	//Buff Value
	var _value = value * 1.5;
	
    //Juice
    cardShake();
    
    //Effect
    instance_create_layer(x,y,"Attacks",oShield,{
        value : _value,
        card : self.id
    });
    
    //Give Temp Health
    addEffect(attackEffects.shield,_value,!_targetEnemy);
    
    //Play Voice
    audioPlayVoice(voiceInfo.shield,false,3);
}


///@self oAttackCard
function actionSlash(_targetEnemy)
{
    //Juice
    cardShake();
    
    //Create Sword
    instance_create_layer(x,y,"Attacks",oSlashAttack,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id
    });
    
}


///@self oAttackCard
function actionBread(_targetEnemy)
{
    //Create Bread
    instance_create_layer(x,y,"Attacks",oBreadAttack,{
        targetEnemy : _targetEnemy,
        value : value,
        breadId : 1,
        card : self.id
    });
}

///@self oAttackCard
function actionLaser(_targetEnemy)
{
    instance_create_layer(x,y,"Attacks",oLaserAttack,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id,
    });
}


///@self oAttackCard
function actionPunch(_targetEnemy)
{
    instance_create_layer(x,y,"Attacks",oFistAttack,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id,
    });
}


///@self oAttackCard
function actionPoison(_targetEnemy)
{
    //Juice
    cardJuice(false);
    
    //Apply Poison
    addEffect(attackEffects.poison,value,_targetEnemy);
    
    //Play Voice
    audioPlayVoice([voiceInfo.poisonInfect,voiceInfo.poisonShip,voiceInfo.poisonSizz],false,3);
}


///@self oAttackCard
function actionFlameAce(_targetEnemy)
{
	//Juice
	cardJuice(false);
	
    //Create Ace
    instance_create_layer(x,y,"Attacks",oFlameAceAttack,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id
    });
}


///@self oAttackCard
function actionMirror(_targetEnemy)
{
	//Create Mirror
    instance_create_layer(x,y,"Attacks",oMirror,{
        value : value,
        card : self.id,
        targetEnemy : _targetEnemy
    });
}


///@self oAttackCard
function actionGhost(_targetEnemy)
{
	//Juice
	cardJuice(false);
	
    //Create Ghost
    instance_create_layer(x,y,"Attacks",oGhostAttack,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id
    });
}


///@self oAttackCard
function actionTaunt(_targetEnemy)
{
    var _y = 0;
    if _targetEnemy
    {
        _y = bbox_top - 50;
    } else _y = bbox_bottom + 50;
    
    instance_create_layer(x,_y,"Attacks",oTaunt,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id
    });
}


//Concept

///@self oAttackCard
function actionSteak(_targetEnemy)
{
    //Juice
    cardJuice(false);
    effectHealth(x,y,10,true,10,25,sprite_get_width(sCardBlank),sprite_get_height(sCardBlank));
    effectNumber(x,y,value);
    
    //Increase Max Health
    if _targetEnemy
    {
        global.playerMaxHp += value;
    } else global.enemyMaxHp += value;
}

///@self oAttackCard
function actionReckless(_targetEnemy)
{
    instance_create_layer(x,y,"Attacks",oReckless,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id,
    });
}
