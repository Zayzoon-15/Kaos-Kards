//Clear Deck
if canPress and pressed
{
    global.deckCardAmount = 0;
    playerDeck = [];
    
    if room == rDeckBuilder2
    {
        oDBDeck.createCards();
    }
}