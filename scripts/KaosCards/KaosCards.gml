function initKaosCards()
{



globalvar kaosCards;

kaosCards = {
    
    swoop : new createCardKaos("Swoop Card",
    "Targets either the enemy or the player and causes a swarm of birds to attack",
    sCardSwoop,swoopKaosAction),
    
    high : new createCardKaos("Inflation",
    "All values are doubled for the current round",
    sCardHigh,highKaosAction),
    
    swap : new createCardKaos("Swap Card",
    "Swaps both the players hands",
    sCardSwap,swapKaosAction),
	
    destroy : new createCardKaos("Deck Wrecker",
    "Destroys one random card from both the players and enemies hand",
    sCardDestroy,destroyKaosAction),
    
};



}