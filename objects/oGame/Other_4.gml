global.gamePaused = false;

if room == rPlayerRoom
{
    gamestate = GAMESTATE.PREPARE;
}

if (room == rMainMenu or room == rEnemySelect) and global.giveCards
{
    instance_create_layer(0,0,"Ui",oCardRewards);
}

if room == rMainMenu or room == rEnemySelect or room == rTutorial or room == rCredits
{
    gamestate = GAMESTATE.MENUS;
    targetEnemy = undefined;
}

if room == rChaosRoom
{
    gamestate = GAMESTATE.KAOS;
}

if room == rMainMenu
{
    texture_flush("Tutorial");
}