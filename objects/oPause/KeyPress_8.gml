///@desc Return To Menu
if canPause and global.gamePaused
{
    gamestate = GAMESTATE.MENUS;
    resetGame();
    resetEverything();
    cardRewards = noone;
    transStart(rMainMenu,seqFadeOut,seqFadeIn);
}