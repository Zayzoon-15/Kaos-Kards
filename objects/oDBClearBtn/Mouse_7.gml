//Clear Deck
if canPress and pressed
{
    //Empty Deck
    global.deckCardAmount = 0;
    playerDeck = [];
    
    //Reset Card Amount
    with oDBCard {cardAmount = 0;}
    
    if room == rDeckBuilder1
    {
        oDBDeck.createCards();
    }
}