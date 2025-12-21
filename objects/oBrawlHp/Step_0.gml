//Get Health
with oBrawlChar
{
	if playerId == other.playerId
	{
		other.targetHp = hp;
	}
}

//Ease Health
hp = lerp(hp,targetHp,.1);

//Ease Shake
shake = lerp(shake,0,.1);