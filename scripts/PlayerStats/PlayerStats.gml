function initPlayerStats()
{

//Vars
globalvar playerHand,playerDeck;
playerHand = undefined;

//Players Deck
playerDeck = [

	//Action Cards
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.mirror,

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
global.maxHandSize = 100;//6;
global.maxDiscards = 100;//round(array_length(playerDeck)/2);

}