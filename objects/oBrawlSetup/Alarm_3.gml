///@desc Kaos Done

//Hurt Loser
randomise();
var _amount = irandom_range(20,30);
if loser == 1
{
	hurtEnemy(_amount);
} else hurtPlayer(_amount);

//Destroy
instance_destroy();
instance_destroy(oBrawlMobile);

//Finish
kaosCardDone();

//Play Song
audioPlayGroupSong(global.bgSyncGroup,lastSong,80);