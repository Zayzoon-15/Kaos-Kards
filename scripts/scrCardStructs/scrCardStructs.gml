

#region Action Cards

globalvar actionCardBread, actionCardFlame, actionCardPoison, actionCardHeal, actionCardLaser,
actionCardShield, actionCardSlash, actionCardFreeze,actionCardFist,actionCardIou;

actionCardIou = {
    name : "Iou",
    type : "Action",
    desc : "I owe you <3 \n(this card doesnt do anything)",
    range : undefined,
    boxsize : {width:100,height:50},
    textYOffset : 0
};

actionCardBread = {
    name : "Bread Card",
    type : "Action",
    desc : "Shoots a piece of bread at\nthe enemy",
    range : {min : 1, max : 6},
    boxsize : {width:100,height:55},
    textYOffset : 3
};

actionCardFlame = {
    name : "Flaming Ace",
    type : "Action",
    desc : "Shoots an Ace of Spades at the enemy\nthat applies burning damage over time",
    range : {min : 1, max : 6},
    boxsize : {width:130,height:60},
    textYOffset : 5
};

actionCardPoison = {
    name : "Poison Card",
    type : "Action",
    desc : "Poisons the enemy\nand applies damage over time",
    range : {min : 1, max : 8},
    boxsize : {width:130,height:60},
    textYOffset : 5
};

actionCardHeal = {
    name : "Heal Card",
    type : "Action",
    desc : "Heals you by a random amount",
    range : {min : 1, max : 10},
    boxsize : {width:100,height:50},
    textYOffset : -5
};

actionCardLaser = {
    name : "Giant F**King Laser",
    type : "Action",
    desc : "Shoots a giant f**king laser\nat the enemy",
    range : {min : 1, max : 6},
    boxsize : {width:130,height:60},
    textYOffset : 0
};

actionCardShield = {
    name : "Defense Card",
    type : "Action",
    desc : "Shields you from any harm\nfor only the current round",
    range : {min : 1, max : 10},
    boxsize : {width:100,height:50},
    textYOffset : 0
};

actionCardSlash = {
    name : "Slash Card",
    type : "Action",
    desc : "Slashes your enemy\nwith a mighty sword",
    range : {min : 1, max : 6},
    boxsize : {width:100,height:50},
    textYOffset : 0
};

actionCardFist = {
    name : "Punch Card",
    type : "Action",
    desc : "Punches your enemy\nin the flipping face",
    range : {min : 1, max : 6},
    boxsize : {width:100,height:50},
    textYOffset : 0
};

actionCardFreeze = {
    name : "Freezing Ace",
    type : "Action",
    desc : "Shoots a freezing Ace of Spades\nat the enemy",
    range : {min : 1, max : 6},
    boxsize : {width:130,height:60},
    textYOffset : 5
};

#endregion


#region Dice Cards

globalvar diceCardReroll, diceCardUpgrade, diceCard8, diceCard12, diceCard20;

diceCardReroll = {
    name : "Reroll",
    type : "Dice",
    desc : "Reroll all the dice\nCan only be placed after roll",
    range : undefined,
    boxsize : {width:100,height:50},
    textYOffset : 0
};

diceCardUpgrade = {
    name : "Dice Upgrade",
    type : "Dice",
    desc : "Adds a random amount to\na random dice roll",
    range : {min : 1, max: 5},
    boxsize : {width:100,height:50},
    textYOffset : 0
};

diceCard8 = {
    name : "8 Sided Dice",
    type : "Dice",
    desc : "Change one random dice\nto an 8 sided dice\nCan only be placed before roll",
    range : undefined,
    boxsize : {width:100,height:60},
    textYOffset : 5
};

diceCard12 = {
    name : "12 Sided Dice",
    type : "Dice",
    desc : "Change one random dice\nto a 12 sided dice\nCan only be placed before roll",
    range : undefined,
    boxsize : {width:100,height:60},
    textYOffset : 5
};

diceCard20 = {
    name : "20 Sided Dice",
    type : "Dice",
    desc : "Change one random dice\nto a 20 sided dice\nCan only be placed before roll",
    range : undefined,
    boxsize : {width:100,height:60},
    textYOffset : 5
};

#endregion


#region Kaos Cards

globalvar kaosCardWheat, kaosCardDestroy, kaosCardHigh , kaosCardSwap;

kaosCardWheat = {
    name : "Swoop Card",
    type : "Chaos",
    desc : "Targets either the enemy or the player\nand causes a swarm of birds to attack",
    range : undefined,
    boxsize : {width:140,height:50},
    textYOffset : -5
};

kaosCardDestroy = {
    name : "Deck Wrecker",
    type : "Chaos",
    desc : "Destroys one random card from\nboth the players and enemies hand",
    range : undefined,
    boxsize : {width:120,height:50},
    textYOffset : -5
};

kaosCardHigh = {
    name : "Inflation",
    type : "Chaos",
    desc : "Multiples all the values on both the\nplayers and enemies hands by 2",
    range : undefined,
    boxsize : {width:120,height:50},
    textYOffset : -5
};

kaosCardSwap = {
    name : "Swap",
    type : "Chaos",
    desc : "Swaps the hands of\nthe player and enemy",
    range : undefined,
    boxsize : {width:80,height:50},
    textYOffset : -5
};

#endregion