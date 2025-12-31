/////////////////////////
//// COMBO ACTIONS ////
///////////////////////

//This is where all action card combos go

/* HOW TO
 * All functions should look like this
 * function action(_targetEnemy)
*/



///@self oAttackCard
function comboHeal(_targetEnemy)
{
	//Charge Card
	with oAttackCard
	{
		actionHeal(_targetEnemy);
	}
	
	//Finish Attack
	timeSourceCreate(2,comboAttackDone);
}


///@self oAttackCard
function comboShield(_targetEnemy)
{
	//Charge Card
	with oAttackCard
	{
		actionShield(_targetEnemy);
	}
	
	//Finish Attack
	timeSourceCreate(2,comboAttackDone);
}


///@self oAttackCard
function comboBread(_targetEnemy)
{
	//Charge Card
	with oAttackCard
	{
		cardSetShake(6,.02);
	}

	//Create Attack
	var _createAttack = function(_targetEnemy,_card) {
		instance_create_layer(x,y,"Attacks",oBreadCombo,{
		    targetEnemy : _targetEnemy,
		    value : _card.value,
		    card : _card
		});
	}
	
	//Start Time To Create Attack
	timeSourceCreate(2,_createAttack,[_targetEnemy,self.id])
}


///@self oAttackCard
function comboSlash(_targetEnemy)
{
	//Charge Card
	with oAttackCard
	{
		cardSetShake(6,.02);
	}

	//Create Attack
	var _createAttack = function(_targetEnemy,_card) {
		instance_create_layer(x,y,"Attacks",oBreadCombo,{
		    targetEnemy : _targetEnemy,
		    value : _card.value,
		    card : _card
		});
	}
	
	//Start Time To Create Attack
	timeSourceCreate(2,_createAttack,[_targetEnemy,self.id])
}