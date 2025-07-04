
#region Global Vars

//Keyboard
global.keyDiscard = undefined;

//Deck
globalvar playerHand,playerDeck;
playerHand = undefined;
playerDeck = [
//Action Cards
actionCards.slash,
actionCards.slash,
actionCards.slash,
actionCards.shield,
actionCards.shield,
actionCards.heal,
actionCards.heal,

//Dice Cards
diceCards.upgrade,
diceCards.upgrade,
diceCards.upgrade,

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

//Font
globalvar fnNumber;
fnNumber = font_add_sprite_ext(sNumbers, "0123456789+-", true, 0);

//Game State
globalvar gameState;
enum GAMESTATES {
	PREPARE,
    GETVALUES,
    ENEMEYTURN,
    KAOS
}
gameState = GAMESTATES.PREPARE;

//Managers
global.isPhone = false;
if os_type == os_android or os_type == os_ios then global.isPhone = true;

#endregion


//Start Game
room_goto(rMain);