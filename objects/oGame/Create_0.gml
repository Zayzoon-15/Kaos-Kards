
#region Global Vars

//Keyboard
global.keyDiscard = ord("Z"); 

//Deck
globalvar playerHand,playerDeck;
playerHand = undefined;
playerDeck = [
//Action Cards
actionCards.slash,
actionCards.shield,
actionCards.heal,
actionCards.punch,
actionCards.slash,
actionCards.shield,

//Dice Cards
diceCards.reroll,
diceCards.reroll,

//Kaos Cards
kaosCards.swoop


];

//Cards
global.holdingCard = false;
enum CARDTYPES {
	ACTION,
    DICE,
    KAOS
}

//Player Stats
global.maxHandSize = 6;
global.maxDiscards = round(array_length(playerDeck)/2);

//Ui
#macro UIBOX_RAD  3 
#macro UIBOX_ALPHA  .6 

#endregion


//Start Game
room_goto(rMain);