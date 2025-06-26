
function resetGame()
{
    ds_list_clear(playerHand);
    ds_list_clear(playersActions);
    ds_list_clear(enemiesActions);
    playerChaosCard = undefined;
    enemyChaosCard = undefined;
    global.playerTempHp = 0;
    global.enemyTempHp = 0;
    global.multiplier = 1;
}

function resetEverything()
{
    global.playerHp = 100;
    global.enemyHp = 100;
    currentRound = 1;
    resetGame();
}