if gamestate == GAMESTATE.PREPARE and !global.holdingCard
{
    if canPress
    {
        drawTipBox("Press when you\nare ready to start", 100, 40, 60);
    } else drawTipBox("You have to roll the\ndice before starting", 110, 40, 60);
}