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
    actionCards.bread,
    actionCards.bread,
    actionCards.bread,
    actionCards.slash,
    actionCards.slash,
    actionCards.punch,
    actionCards.punch,
    actionCards.laser,
    actionCards.laser,
    actionCards.flamingAce,
    actionCards.flamingAce,
    actionCards.poison,
    actionCards.poison,
    actionCards.mirror,
    actionCards.mirror,
    actionCards.gato,
    
    
	//Dice Cards
	diceCards.upgrade,
	diceCards.reroll,
    diceCards.dice8,
	diceCards.dice12,
	diceCards.dice20,

	//Kaos Cards
	kaosCards.destroy,
	kaosCards.swap,
	kaosCards.high,
	kaosCards.swoop,
	kaosCards.freeze,

];

//Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)*.6);

}