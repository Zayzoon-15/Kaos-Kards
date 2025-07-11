function initDiceCards()
{



globalvar diceCards;

diceCards = {
    
    reroll : new createCard("Reroll",
    "Reroll all the dice\nCan only be placed after roll",
    undefined,CARDTYPES.DICE,sDiceCard),
    
    upgrade : new createCard("Dice Upgrade",
    "Adds a random amount to a random dice roll",
    {min:1,max:6},CARDTYPES.DICE,sDiceCard),
    
    dice8 : new createCard("8 Sided Dice",
    "Changes one random dice to an 8 sided dice\nCan only be placed before roll",
    undefined,CARDTYPES.DICE,sDiceCard),
    
    dice12 : new createCard("12 Sided Dice",
    "Changes one random dice to a 12 sided dice\nCan only be placed before roll",
    undefined,CARDTYPES.DICE,sDiceCard),
    
    dice20 : new createCard("20 Sided Dice",
    "Changes one random dice to a 20 sided dice\nCan only be placed before roll",
    undefined,CARDTYPES.DICE,sDiceCard),
    
};



}