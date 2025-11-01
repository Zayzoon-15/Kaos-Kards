function initPlayerStats()
{

//Vars
globalvar playerHand,playerDeck;
playerHand = undefined;

//Players Deck
playerDeck = [

	//Action Cards
	actionCards.heal,
	actionCards.heal,
	actionCards.shield,
	actionCards.shield,
	actionCards.slash,
	actionCards.slash,
	actionCards.punch,
	actionCards.punch,
	actionCards.laser,
	actionCards.laser,
	actionCards.laser,
	actionCards.bread,
	actionCards.bread,

	//Dice Cards
	diceCards.upgrade,
	diceCards.reroll,
    diceCards.dice8,
	diceCards.dice12,
	diceCards.dice20,

	//Kaos Cards
	//kaosCards.destroy,
	//kaosCards.swap,
	//kaosCards.high,
	kaosCards.swoop,

];

//Stats
global.maxHandSize = 6;
global.maxDiscards = 99;//round(array_length(playerDeck)/2);

}