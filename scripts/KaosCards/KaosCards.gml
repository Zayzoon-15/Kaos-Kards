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
    "Destroys one random card from enemies hand",
    sCardDestroy,kaosActionDestroy),
    
    freeze : new createCardKaos("Freezing Ace",
    "Freezes a random slot from the enemies side making it unusable",
    sCardFreeze,kaosActionFreeze),
    
    rps : new createCardKaos("Rock Paper Scissors",
    "Play rock paper scissors against the enemy",
    sCardRps,kaosActionRps),
	
    brawl : new createCardKaos("Retro Brawler Card",
    "Play smash bros bro lets smash rn bro >:D",
    sCardBrawl,kaosActionBrawl),
	
    sticky : new createCardKaos("Sticky Hand",
    "Use a sticky hand to steal a card from the enemy",
    sCardSticky,kaosActionSticky),
    
    hotdog : new createCardKaos("Hotdog!",
    "Compete in a hotdog eating contest with the enemy to gain health",
    sCardHotdog,kaosActionHotdog),
    
    //CONCEPT
    
    time : new createCardKaos("Speedrun",
    "PLACE YOUR CARDS FAST",
    sCardHigh,kaosActionSwoop),
    
};



}