/////////////////////////
///// KAOS ACTIONS /////
///////////////////////

//This is where all koas card attacks go

/* HOW TO
 * All functions should look like this
 * function action(_card,_targetEnemy)
*/


///@self oAttackCard
function swoopKaosAction(_card,_targetEnemy)
{
	//Create Bread Attack
	instance_create_layer(_card.x,_card.y-50,"Attacks",oSwoopChoose);
	
	//Juice
	_card.cardJuice(true);
}

///@self oAttackCard
function swapKaosAction(_card,_targetEnemy)
{
	//Show Message
	createAlertMessage("All Cards Swapped");
	
	//Juice
	with _card
	{
		randomize();
		angle += 360 * choose(-1,1);
		cardJuice(true,false);
	}
	
	#region Swap Cards
	
	//Get Actions
	var _playersActs = playerActions;
	var _enemyActs = enemyActions;
	
	//Change Actions
	playerActions = _enemyActs;
	enemyActions = _playersActs;
	
	#endregion
}

///@self oAttackCard
function highKaosAction(_card,_targetEnemy)
{
	//Show Message
	createAlertMessage("All Values Doubled");
	
	//Juice
	_card.cardJuice(true);
	
	//Double Values
	global.valueMult *= 2;
}

///@self oAttackCard
function destroyKaosAction(_card,_targetEnemy)
{
	//Juice
	_card.cardJuice(false);
	
	//Take From Enemy
	instance_create_layer(0,0,"Attacks",oDestroyedCard,{
		targetEnemy : true
	});
	
	//Take From Player
	instance_create_layer(0,0,"Attacks",oDestroyedCard,{
		targetEnemy : false
	});
}