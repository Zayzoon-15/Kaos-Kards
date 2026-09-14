function initPlayerStats()
{

//Vars
globalvar playerHand,playerDeck;
playerHand = undefined;

//Players Deck
playerDeck = [
    
	//Action
	CardsAction.Heal,
	CardsAction.Heal,
	CardsAction.Heal,
	CardsAction.Shield,
	CardsAction.Shield,
	CardsAction.Shield,
    
    CardsAction.Slash,
    CardsAction.Slash,
    CardsAction.Slash,
	
    //Dice
    CardsDice.Reroll,
    CardsDice.Upgrade,

];

//Set Full Deck
global.playerFullDeck = playerDeck;
global.playerSeenCards = playerDeck;

//Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)*.6);
global.discards = 0;
global.handsize = global.maxHandSize;

//Set Deck Size For Now
global.deckCardAmount = array_length(playerDeck);

//Favorites
global.favCards = [];

}