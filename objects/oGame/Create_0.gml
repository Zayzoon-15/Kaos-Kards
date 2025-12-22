#region Initialize Info

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
global.comboMult = 2.5;

//Cards
global.holdingCard = false;
global.disabledSlots = {
    player: array_create(4,false),
    enemy : array_create(4,false)
};

//Enemy
global.currentEnemy = enemyInfo.dog;

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

//Actions
globalvar playerActions, enemyActions, playerKaos, enemyKaos;
playerActions = ds_list_create();
enemyActions = ds_list_create();
playerKaos = undefined;
enemyKaos = undefined;

//Font
globalvar fnNumber,fnNumberOutline;
var _numString = "0123456789+-";
fnNumber = font_add_sprite_ext(sNumbers, _numString, true, 0);
fnNumberOutline = font_add_sprite_ext(sNumbersOutlined, _numString, true, 0);

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
global.paused = false;

//Mobile
global.mobile = os_type == os_android or os_type == os_ios;

//Gamepad
global.gamepad = false;

#endregion

//Load Groups
audio_group_load(agMusic);
audio_group_load(agSfx);

//Load Save
saveLoad();

//Set Window
setWindowToRes();