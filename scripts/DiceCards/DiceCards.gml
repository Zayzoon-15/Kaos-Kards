
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
    
    dice8: {
        name : "8 Sided Dice",
        desc : "Changes one random dice to an 8 sided dice\nCan only be placed before roll",
        range : undefined,
        type : CARDTYPES.DICE,
        sprite : sDiceCard,
    },
    
    dice12: {
        name : "12 Sided Dice",
        desc : "Changes one random dice to a 12 sided dice\nCan only be placed before roll",
        range : undefined,
        type : CARDTYPES.DICE,
        sprite : sDiceCard,
    },
    
    dice20: {
        name : "20 Sided Dice",
        desc : "Changes one random dice to a 12 sided dice\nCan only be placed before roll",
        range : undefined,
        type : CARDTYPES.DICE,
        sprite : sDiceCard,
    },
    
};