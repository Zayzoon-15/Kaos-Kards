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
    //Juice
    cardJuice(false);
    healthEffect(x,y,10,10,25,sprite_get_width(sCardBlank),sprite_get_height(sCardBlank));
    numberEffect(x,y,value);
    
    //Give Health
    if _targetEnemy
    {
        healPlayer(value);
    } else healEnemy(value);
}


///@self oAttackCard
function actionShield(_targetEnemy)
{
    //Juice
    cardShake();
    
    //Effect
    instance_create_layer(x,y,"Attacks",oShield,{
        value : value,
        card : self.id
    });
    
    //Give Temp Health
    addEffect(attackEffects.shield,value,!_targetEnemy);
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
        card : self.id
    });
}


///@self oAttackCard
function actionPunch(_targetEnemy)
{
    instance_create_layer(x,y,"Attacks",oFistAttack,{
        targetEnemy : _targetEnemy,
        value : value,
        card : self.id
    });
}


///@self oAttackCard
function actionPoison(_targetEnemy)
{
    //Juice
    cardJuice(false);
    
    //Apply Poison
    addEffect(attackEffects.poison,value,_targetEnemy);
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
