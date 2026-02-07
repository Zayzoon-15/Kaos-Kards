

#region Initialize Info

initDeck();
initActionCards();
initDiceTypes();
initDiceCards();
initKaosCards();
initEnemyinfo();
initPlayerStats();
initSettings();

#endregion

#region Global Vars

//Values
global.valueMult = 1;
global.comboMult = 2;

//Cards
global.holdingCard = false;
global.disabledSlots = {
    player: array_create(4,false),
    enemy : array_create(4,false)
};
global.cardUses = {
    player: [],
    enemy : []
}

//Enemy
global.currentEnemy = enemyInfo.bones;
global.enemySpecialUses = 0;

//Removes
global.playerRemovedCards = [];
global.enemyRemovedCards = [];
global.playerAddCards = [];
global.enemyAddCards = [];

//Health
global.playerHp = 100;
global.playerTempHp = 0;
global.enemyHp = 100;
global.enemyTempHp = 0;
global.playerHpIcons = [];
global.enemyHpIcons = [];

//Meter
global.playerComboMeter = 0;
global.enemyComboMeter = 0;
global.playerPerformance = 0;
global.enemyPerformance = 0;

//Actions
globalvar playerActions, enemyActions, playerKaos, enemyKaos;
playerActions = ds_list_create();
enemyActions = ds_list_create();
playerKaos = undefined;
enemyKaos = undefined;

#region Custom Fonts

//Set Global Vars
globalvar fnNumber,fnNumberOutline,fnDBLetter,fnDBNumber;

//Game Numbers
var _numString = "0123456789+-";
fnNumber = font_add_sprite_ext(sNumbers, _numString, true, 0);
fnNumberOutline = font_add_sprite_ext(sNumbersOutlined, _numString, true, 0);

//Deck Builder
fnDBLetter = font_add_sprite_ext(sDBLetters,"ABCDEFGHIJKLMNOPQRSTUVWXYZ|:",true,0);
fnDBNumber = font_add_sprite_ext(sDBNumbers,"/0123456789",true,0);

#endregion

//Game State
globalvar gameState;
enum GAMESTATES {
	PREPARE,
    GETVALUES,
    ENEMEYTURN,
    KAOS
}
gameState = GAMESTATES.PREPARE;
global.gameRound = 0;

//Managers
global.paused = false;

//Modes
global.mobile = os_type == os_android or os_type == os_ios or os_type == os_gxgames;
global.gamepad = false;

#endregion

//Randomise
randomise();

//Load Groups
audio_group_load(agMusic);
audio_group_load(agSfx);
audio_group_load(agVoice);

//Load Save
loadSettings();
loadGameSave();

//Set Window
setWindowToRes();