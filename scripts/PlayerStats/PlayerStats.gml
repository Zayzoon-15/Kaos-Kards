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
	actionCards.bread,
	actionCards.bread,
	actionCards.bread,
	actionCards.flamingAce,
	actionCards.laser,
	actionCards.punch,
	actionCards.poison,
	
	//Kaos Cards
	kaosCards.rps,
	kaosCards.brawl,
	kaosCards.swoop,
	kaosCards.swap,
	kaosCards.destroy,
	kaosCards.freeze,
	kaosCards.high,
	
	//Dice Cards
	diceCards.dice20,
	diceCards.dice12,
	diceCards.dice8,
	diceCards.reroll,
	diceCards.upgrade,

];

//Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)*.6);

}