function initKaosCards()
{



globalvar kaosCards;

kaosCards = {
    
    swoop : new createCard("Swoop Card",
    "Targets either the enemy or the player and causes a swarm of birds to attack",
    undefined,CARDTYPES.KAOS,sSwoopCard,swoopKaosAction),
    
    high : new createCard("Inflation",
    "All values are doubled for the current round",
    undefined,CARDTYPES.KAOS,sHighCard,highKaosAction),
    
    swap : new createCard("Swap Card",
    "Swaps both the players hands",
    undefined,CARDTYPES.KAOS,sSwapCard,swapKaosAction),
	
    destroy : new createCard("Deck Wrecker",
    "Destroys one random card from both the players and enemies hand",
    undefined,CARDTYPES.KAOS,sDestroyCard,destroyKaosAction,120),
    
};



}