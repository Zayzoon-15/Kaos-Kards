
#region Draw Current Cards

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnMain);

var _x = room_width/2;
var _y = 710;

if !global.midTrans
{
    drawBox(_x,_y,60,20,17);
    
    draw_text(_x,_y,$"Hand:{currentCards}/{maxHandSize}\nCards in Play:{cardsInPlay}/{maxHandSize}");
}

#endregion

//Draw Tip
if !global.holdingCard and gamestate == GAMESTATE.PREPARE
{
    if cardsInPlay != maxHandSize and cardsPicked != totalCards
    {
        drawTipBox("Click to get\na new card", 70, 40, 60);
    }
    
    if cardsInPlay == maxHandSize and cardsPicked != totalCards
    {
        drawTipBox("You have the max\ncards in play", 100, 40, 60);
    }
    
    if cardsPicked == totalCards
    {
        drawTipBox("There are no cards\nleft in the deck", 105, 40, 60);
    }
}