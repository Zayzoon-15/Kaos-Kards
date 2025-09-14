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
	
}

///@self oAttackCard
function highKaosAction(_card,_targetEnemy)
{
	
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