///@desc Check Health


//Someone Died
if global.playerHp <= 0 or global.enemyHp <= 0
{
	//Sound
	if instance_exists(oParAttacks) or instance_exists(oAttackCard)
	{
		audioPlaySfx([snStars1,snStars2]);
	}
	
	//Destroy Attacks
	instance_destroy(oAttackEffect);
	with oParAttacks
	{
		effectStar(x,y,5,false);
		instance_destroy();
	}
	
	//Destroy Cards
	with oAttackCard
	{
		effectStar(x,y,10,false,20,25);
		instance_destroy();
	}
	
	//Create Gameover
	instance_create_layer(0,0,"Manager",oGameOver,{
		playerWon : global.playerHp > 0
	});
	
	//Destroy Kaos
	instance_destroy();
}