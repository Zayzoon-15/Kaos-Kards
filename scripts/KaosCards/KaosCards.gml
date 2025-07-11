function initKaosCards()
{



globalvar kaosCards;

kaosCards = {
    
    swoop : new createCard("Swoop Card",
    "Targets either the enemy or the player and causes a swarm of birds to attack",
    undefined,CARDTYPES.KAOS,sSwoopCard),
    
    high : new createCard("Inflation",
    "All values are doubled for the current round",
    undefined,CARDTYPES.KAOS,sHighCard),
    
    swap : new createCard("Swap Card",
    "Swaps both the players hands",
    undefined,CARDTYPES.KAOS,sSwapCard),
    
};



}