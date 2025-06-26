//Draw Info
if gamestate == GAMESTATE.PREPARE
{
    if !full
    {
        drawTipBox("Drag a card here\nto discard it", 100, 40, 60);
    } else drawTipBox("You have no\ndiscards left", 70, 40, 60);
    
}