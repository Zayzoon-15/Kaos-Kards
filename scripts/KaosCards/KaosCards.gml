function initKaosCards()
{



globalvar kaosCards;

kaosCards = {
    
    swoop : new createCardKaos("Swoop",
    "Targets either the enemy or the player and causes a swarm of birds to attack",
    sCardSwoop,kaosActionSwoop),
    
    discard : new createCardKaos("Clean Up",
    "Cleans the discard bin for all players",
    sCardDiscard,kaosActionDiscard),
    
    handy : new createCardKaos("Handy",
    "Increases everyones hand size by 1",
    sCardHandy,kaosActionHandy,[],undefined,4),
    
    high : new createCardKaos("Inflation",
    $"All values are multiplied by [s][m]x [glo]+0.1valueMult[/][/] for the current round[s][lg](The value increases by .1 after every use)",
    sCardHigh,kaosActionHigh),
    
    swap : new createCardKaos("Swap",
    "Swaps both the players hands",
    sCardSwap,kaosActionSwap),
	
    destroy : new createCardKaos("Deck Wrecker",
    "Destroys one random card from enemies hand",
    sCardDestroy,kaosActionDestroy),
    
    freeze : new createCardKaos("Freezing Ace",
    "[aq]Freezes[/] a random slot from the enemies side making it unusable",
    sCardFreeze,kaosActionFreeze),
    
    rps : new createCardKaos("Rock Paper Scissors",
    "Play rock paper scissors against the enemy",
    sCardRps,kaosActionRps),
	
    brawl : new createCardKaos("Retro Brawler Card",
    "Play smash bros bro lets smash rn bro >:D",
    sCardBrawl,kaosActionBrawl),
	
    sticky : new createCardKaos("Sticky Hand",
    "Use a sticky hand to steal a card from the enemy",
    sCardSticky,kaosActionSticky,[],undefined,4),
    
    hotdog : new createCardKaos("Hotdog!",
    "Compete in a hotdog eating contest with the enemy to gain [g]health",
    sCardHotdog,kaosActionHotdog),
    
    brokenDefense : new createCardKaos("Broken Defense",
    "Gain  [m]100%[/]  of [g]max health[/] as [b]shield[/] but reduce [g]max health[/] by a random amount",
    sCardBrokenDefense,kaosActionBrokenDefense),
    
    rerun : new createCardKaos("Rerun",
    "Retrigger all cards played this round again",
    sCardRerun,kaosActionRerun),
    
    vampire : new createCardKaos("Vampire",
    "Halfs all card values and applies them to the next round",
    sCardBlank,kaosActionVampire,[],updateKaosVampire),
    
    //Concept
    hotsauce : new createCardKaos("Hot Sauce",
    "All [g]healing[/] cards apply slight [o]fire damage[/] for the round",
    sCardHotsauce,kaosActionHotsauce),
    
    herobrine : new createCardKaos("Herobrine",
    "[lg]???",
    sCardBlank,function(){game_end();}),
    
};



}