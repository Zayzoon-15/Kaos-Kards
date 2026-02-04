//Get Health
with oBrawlChar
{
	if playerId == other.playerId
	{
		other.targetHp = hp;
	}
}

//Ease Health
hp = lerp_dt(hp,targetHp,.1);

//Ease Shake
shake = lerp_dt(shake,0,.1);