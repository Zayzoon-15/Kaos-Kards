function initPlayerStats()
{

//Vars
globalvar playerHand,playerDeck;
playerHand = undefined;

//Players Deck
playerDeck = [
    
	//Action
    actionCards.heal,
    actionCards.heal,
    actionCards.shield,
    actionCards.shield,
    actionCards.shield,
    
    actionCards.slash,
    actionCards.slash,
    actionCards.slash,
    actionCards.bread,
    actionCards.bread,
    actionCards.bread,
    
    //Kaos
    kaosCards.swoop,
	
    //Dice
    diceCards.reroll,
    diceCards.dice8,
    diceCards.upgrade,

];

//Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)*.6);
global.discards = 0;

//Set Deck Size For Now
global.deckCardAmount = array_length(playerDeck);

}