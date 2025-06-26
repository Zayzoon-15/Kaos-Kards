playerDone = false;
enemyDone = false;

currentPlayerAction = 0;
currentEnemyAction = 0;

randomize();
playerPauseTime = 60;
enemyPauseTime = playerPauseTime + 30;

//Play Like Normal
if enemyChaosCard == undefined and playerChaosCard == undefined
{
    alarm[0] = playerPauseTime;
    alarm[1] = enemyPauseTime;
}

//Who Goes First
playerFirst = true;

if enemyChaosCard != undefined and playerChaosCard != undefined
{
    playerFirst = choose(true,false);
}

if enemyChaosCard != undefined and playerChaosCard == undefined
{
    playerFirst = false;
}


//Play Players Chaos Card
if playerChaosCard != undefined
{
    if playerFirst
    {
        alarm[2] = 10;
    }
}

//Play Enemies Chaos Card
if enemyChaosCard != undefined
{
    if !playerFirst
    {
        alarm[3] = 10;
    }
}

//Set Game State
gamestate = GAMESTATE.KAOS;