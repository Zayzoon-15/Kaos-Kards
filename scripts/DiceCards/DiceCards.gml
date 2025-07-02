
globalvar diceCards;

diceCards = {
    
    base: {
        name : "Dice Card",
        desc : "Card Description",
        range : undefined,
        type : CARDTYPES.DICE,
        sprite : sDiceCard,
    },
    
    reroll: {
        name : "Reroll",
        desc : "Reroll all the dice\nCan only be placed after roll",
        range : undefined,
        type : CARDTYPES.DICE,
        sprite : sDiceCard,
    },
    
    upgrade: {
        name : "Dice Upgrade",
        desc : "Adds a random amount to a random dice roll",
        range : {min:1,max:6},
        type : CARDTYPES.DICE,
        sprite : sDiceCard,
    },
    
};