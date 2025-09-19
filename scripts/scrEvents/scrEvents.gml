
///@desc This event plays when the next round starts
function nextRoundStarted()
{
	//Reduce Assist Effects
	reduceAssEffects(10,true);
	reduceAssEffects(10,false);
	
	//Reset Mult
	global.valueMult = 1;
}