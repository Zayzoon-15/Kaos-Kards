/////////////////////////
//// COMBO ACTIONS ////
///////////////////////

//This is where all action card combos go

/* HOW TO
 * All functions should look like this
 * function action(_targetEnemy)
*/



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
	
	//Start Time4 To Create Attack
	timeSourceCreate(2,_createAttack,[_targetEnemy,self.id])
}