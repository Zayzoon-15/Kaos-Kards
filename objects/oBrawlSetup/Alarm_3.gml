///@desc Kaos Done

//Hurt Loser
var _amount = irandom_range(20,30);
if loser == 1
{
	hurtEnemy(_amount*global.currentEnemy.difficulty);
} else hurtPlayer(_amount);

//Destroy
instance_destroy();
instance_destroy(oBrawlMobile);

//Finish
kaosCardDone();