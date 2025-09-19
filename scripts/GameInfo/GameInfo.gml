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
	actionCards.shield,

	//Dice Cards
	//diceCards.upgrade,

	//Kaos Cards
	kaosCards.destroy,
	kaosCards.swap,
	kaosCards.high,

];

//Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)/2);

}