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
	
	kaosCards.rps

];

//Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)*.6);

}