function initDiceTypes()
{
	
globalvar diceTypes;
	
diceTypes =  {
    
	d6 : {
	    sprite : sDice6,
	    range : {min:1,max:6},
	    color : c_white
	},
    
	d8 : {
	    sprite : sDice8,
	    range : {min:3,max:8},
	    color : #f6e0ff
	},
    
	d12 : {
	    sprite : sDice12,
	    range : {min:5,max:12},
	    color : #d2ffff
	},
    
	d20 : {
	    sprite : sDice20,
	    range : {min:8,max:20},
	    color : #b23227
	},
    
}


}



function initDiceCards()
{
initDiceTypes();


globalvar diceCards;

diceCards = {
    
    reroll : new createCardDice("Reroll",
    "Reroll all the dice\nCan only be placed after roll",
    sCardDice,diceCardReroll),
    
    upgrade : new createCardDice("Dice Upgrade",
    "Adds a random amount to a random dice roll",
    sCardDice,undefined,[],[1,6]),
    
    dice8 : new createCardDice("8 Sided Dice",
    "Changes one random dice to an 8 sided dice\nCan only be placed before roll",
    sCardDice,diceCardSwapDice,[diceTypes.d8]),
    
    dice12 : new createCardDice("12 Sided Dice",
    "Changes one random dice to a 12 sided dice\nCan only be placed before roll",
    sCardDice,diceCardSwapDice,[diceTypes.d12]),
    
    dice20 : new createCardDice("20 Sided Dice",
    "Changes one random dice to a 20 sided dice\nCan only be placed before roll",
    sCardDice,diceCardSwapDice,[diceTypes.d20]),
    
};



}