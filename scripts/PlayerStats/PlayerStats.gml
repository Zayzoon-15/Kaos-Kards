function initPlayerStats()
{

//Vars
globalvar playerHand,playerDeck;
playerHand = undefined;

//Players Deck
playerDeck = [
    
    actionCards.bread,
    actionCards.bread,
    actionCards.bread,
    actionCards.bread,
    actionCards.bread,
    actionCards.gato,
    actionCards.gato,
    actionCards.gato,
    actionCards.gato,

	//Action Cards
    //actionCards.poison,
    //actionCards.poison,
    //actionCards.poison,
    //actionCards.poison,
    //actionCards.poison,
    //actionCards.poison,
    //actionCards.poison,
    
    
	////Dice Cards
	//diceCards.upgrade,
	//diceCards.reroll,
    //diceCards.dice8,
	//diceCards.dice12,
	//diceCards.dice20,
//
	////Kaos Cards
	//kaosCards.destroy,
	//kaosCards.swap,
	//kaosCards.high,
	//kaosCards.swoop,

];

//Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)/2);

}