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
    
    //CONCEPT
    time : new createCardKaos("Speedrun",
    "PLACE YOUR CARDS FAST",
    sCardHigh,kaosActionSwoop),
    
    
    //JOKE
    pizza : new createCardKaos("Pizza",
    "Pizza Pizza",
    sCardBrawl,kaosActionSwoop),
    
    balls : new createCardKaos("BALLS",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    balls2 : new createCardKaos("BALLS2",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    balls3 : new createCardKaos("BALLS3",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    balls3Dlc : new createCardKaos("BALLS3 DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    balls4 : new createCardKaos("BALLS4 The Prequel",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsR : new createCardKaos("BALLS1 Remaster",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsS : new createCardKaos("BALLS The SECRET",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsS2 : new createCardKaos("BALLS The SECRET 2",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsS2D : new createCardKaos("BALLS The SECRET 2 DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsB : new createCardKaos("BALLS And BIMBO",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsB2 : new createCardKaos("BALLS And BIMBO2",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsB3 : new createCardKaos("BALLS And BIMBO3",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsBDLC : new createCardKaos("BALLS And BIMBO3 DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsB2D : new createCardKaos("BALLS And BIMBO2 + DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsB3DLC : new createCardKaos("BALLS And BIMBO3 + DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsBDLC4 : new createCardKaos("BALLS And BIMBO4 + DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsB5 : new createCardKaos("BALLS And BIMBO5",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsBDLC5 : new createCardKaos("BALLS And BIMBO5 + DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsB5 : new createCardKaos("BALLS And BIMBO5",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsW : new createCardKaos("BALLS Wombat",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsW2 : new createCardKaos("BALLS Wombat2",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsW3 : new createCardKaos("BALLS Wombat3",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsW4 : new createCardKaos("BALLS Wombat4",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsW5 : new createCardKaos("BALLS Wombat5",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsW5DLC : new createCardKaos("BALLS Wombat5 DLC",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigma : new createCardKaos("BALLS Ligma",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE : new createCardKaos("BALLS Ligma Extreme",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE2 : new createCardKaos("BALLS Ligma Extreme2",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE3 : new createCardKaos("BALLS Ligma Extreme3",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE4 : new createCardKaos("BALLS Ligma Extreme4",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE5 : new createCardKaos("BALLS Ligma Extreme5",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE6 : new createCardKaos("BALLS Ligma Extreme6",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE7 : new createCardKaos("BALLS Ligma Extreme7",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
    ballsLigmaE8 : new createCardKaos("BALLS Ligma Extreme8",
    "My Balls",
    sCardSticky,kaosActionSwoop),
    
};



}