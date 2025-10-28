function initDiceTypes()
{
	
	
	
globalvar diceTypes;
	
diceTypes =  {
    
	dice6 : {
	    sprite : sDice6,
	    range : {min:1,max:6},
	    color : c_white
	},
    
	dice8 : {
	    sprite : sDice8,
	    range : {min:3,max:8},
	    color : #f6e0ff
	},
    
	dice12 : {
	    sprite : sDice12,
	    range : {min:5,max:12},
	    color : #d2ffff
	},
    
	dice20 : {
	    sprite : sDice20,
	    range : {min:8,max:20},
	    color : #b23227
	},
    
}



}


function initDiceCards()
{



globalvar diceCards;

diceCards = {
    
    reroll : new createCard("Reroll",
    "Reroll all the dice\nCan only be placed after roll",
    undefined,CARDTYPES.DICE,sCardDice,diceCardReroll),
    
    upgrade : new createCard("Dice Upgrade",
    "Adds a random amount to a random dice roll",
    {min:1,max:6},CARDTYPES.DICE,sCardDice),
    
    dice8 : new createCard("8 Sided Dice",
    "Changes one random dice to an 8 sided dice\nCan only be placed before roll",
    undefined,CARDTYPES.DICE,sCardDice,diceCardSwapDice,0,diceTypes.dice8),
    
    dice12 : new createCard("12 Sided Dice",
    "Changes one random dice to a 12 sided dice\nCan only be placed before roll",
    undefined,CARDTYPES.DICE,sCardDice,diceCardSwapDice,0,diceTypes.dice12),
    
    dice20 : new createCard("20 Sided Dice",
    "Changes one random dice to a 20 sided dice\nCan only be placed before roll",
    undefined,CARDTYPES.DICE,sCardDice,diceCardSwapDice,0,diceTypes.dice20),
    
};



}