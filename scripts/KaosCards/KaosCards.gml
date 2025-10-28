function initKaosCards()
{



globalvar kaosCards;

kaosCards = {
    
    swoop : new createCard("Swoop Card",
    "Targets either the enemy or the player and causes a swarm of birds to attack",
    undefined,CARDTYPES.KAOS,sCardSwoop,swoopKaosAction,120),
    
    high : new createCard("Inflation",
    "All values are doubled for the current round",
    undefined,CARDTYPES.KAOS,sCardHigh,highKaosAction),
    
    swap : new createCard("Swap Card",
    "Swaps both the players hands",
    undefined,CARDTYPES.KAOS,sCardSwap,swapKaosAction),
	
    destroy : new createCard("Deck Wrecker",
    "Destroys one random card from both the players and enemies hand",
    undefined,CARDTYPES.KAOS,sCardDestroy,destroyKaosAction,120),
    
};



}