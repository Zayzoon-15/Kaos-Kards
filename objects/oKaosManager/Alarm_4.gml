///@desc Play Cards Or Start Enemies Chaos

//Play Cards
if enemyChaosCard == undefined and playerChaosCard == undefined
{
    alarm[0] = playerPauseTime;
    alarm[1] = enemyPauseTime;
}

//Play Player
if playerChaosCard != undefined
{
    alarm[2] = 60;
}

//Play Enemy
if enemyChaosCard != undefined
{
    alarm[3] = 60;
}