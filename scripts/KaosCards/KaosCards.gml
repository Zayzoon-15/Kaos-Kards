function initKaosCards()
{



globalvar kaosCards;

kaosCards = {
    
    swoop : new createCardKaos("Swoop Card",
    "Targets either the enemy or the player and causes a swarm of birds to attack",
    sCardSwoop,kaosActionSwoop),
    
    high : new createCardKaos("Inflation",
    "All values are doubled for the current round",
    sCardHigh,kaosActionHigh),
    
    swap : new createCardKaos("Swap Card",
    "Swaps both the players hands",
    sCardSwap,kaosActionSwap),
	
    destroy : new createCardKaos("Deck Wrecker",
    "Destroys one random card from both the players and enemies hand",
    sCardDestroy,kaosActionDestroy),
    
    freeze : new createCardKaos("Freezing Ace",
    "Freezes a random slot from both the players and enemies side",
    sCardFreeze,kaosActionFreeze),
    
    rps : new createCardKaos("Rock Paper Scissors",
    "Play rock paper scissors against the enemy",
    sCardRps,kaosActionRps),
    
};



}