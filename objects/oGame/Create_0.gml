

#region Global Vars


globalvar playerHand,playerDeck;
playerHand = ds_list_create();

//Starting Deck
playerDeck = [

//Action Cards
oCardHeal,
oCardHeal,
oCardShield,
oCardShield,
oCardSlash,
oCardSlash,
oCardSlash,
oCardSlash,

//Deck Cards
oCardReroll,
oCardReroll,
];

global.holdingCard = false;

//Fullscreen
global.fullscreen = false;

//Sound
global.masterVol = 5;

audio_master_gain(0);

audio_group_load(agSfx);
audio_group_load(agMusic);

audio_group_set_gain(agMusic,.2,.1);
audio_group_set_gain(agSfx,1,.1);

//Game State
globalvar gamestate;

enum GAMESTATE {
    MENUS,
	PREPARE,
    GETVALUES,
    ENEMYTURN,
    KAOS,
    PLAYERWIN,
    PLAYERLOSS
};

gamestate = GAMESTATE.MENUS;

globalvar currentRound,targetEnemy;
currentRound = 1;
targetEnemy = undefined;


//Hand
globalvar playersActions,enemiesActions;

playersActions = ds_list_create();
enemiesActions = ds_list_create();

globalvar playerChaosCard, enemyChaosCard;
playerChaosCard = undefined;
enemyChaosCard = undefined;

//Reward
globalvar cardRewards,cardsToGive;
cardRewards = [oCardIou];
cardsToGive = [];
global.giveCards = false;
global.showCards = false;

//Font
globalvar fnNumber;
fnNumber = font_add_sprite_ext(sNumbers, "0123456789+-", true, 0);

//Game Paused
global.gamePaused = false;

//Card
globalvar cardShake;
cardShake = 40;
global.multiplier = 1;

//Health
global.playerHp = 100;
global.enemyHp = 100;
global.playerTempHp = 0;
global.enemyTempHp = 0;

//Enemies
global.beatDawg = false;
global.beatAngel = false;
global.beatBuggy = false;
global.beatAlien = false;
global.beatBeer = false;
global.beatEveryone = false;

//Upgrades
global.playerHandSize = 6;
global.discardSpace = 10;

//Bread
global.breadFirst = true;

#endregion

//Load Game
loadSave();



//Start Game
alarm[0] = 20;

