
//Initialize Info
initActionCards();
initDiceCards();
initKaosCards();
initEnemyinfo();
initPlayerStats();

#region Global Vars

//Controls
global.keyDiscard = undefined;

//Values
global.valueMult = 1;

//Cards
global.holdingCard = false;

//Enemy
global.currentEnemy = enemyInfo.dog;

//Health
global.playerHp = 100;
global.playerTempHp = 0;
global.enemyHp = 100;
global.enemyTempHp = 0;
global.playerHpIcons = [];
global.enemyHpIcons = [];

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
global.mobile = false;
if os_type == os_android or os_type == os_ios then global.mobile = true;

#endregion

//Start Game
room_goto_next();