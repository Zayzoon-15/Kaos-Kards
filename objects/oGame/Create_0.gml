#region Initialize Info

initDeck();
initActionCards();
initDiceTypes();
initDiceCards();
initKaosCards();
initEnemyinfo();
initTourney();
initPlayerStats();
initSettings();
initVoices();

#endregion

#region Global Vars

//Values
global.valueMult = 1;
global.comboMult = 1;
global.repeatTimes = 0;
global.healEffects = {
    player: [],
    enemy : []
}

//Cards
global.holdingCard = false;
global.disabledSlots = {
    player: array_create(4,false),
    enemy : array_create(4,false)
};

global.cardUses = {
    player: [],
    enemy : []
};

global.gamelog = ds_list_create();

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
global.playerMaxHp = 100;
global.enemyMaxHp = 100;

//Create Lists
globalvar playerEffects,enemyEffects;
playerEffects = ds_map_create();
enemyEffects = ds_map_create();

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

//Time
global.gameTimer = 0;

#region Custom Fonts

//Set Global Vars
globalvar fnNumber,fnNumberOutline,fnDBLetter,fnDBNumber,fnTRNumber,fnBreakRoom;

//Game Numbers
var _numString = "0123456789+-";
fnNumber = font_add_sprite_ext(sNumbers, _numString, true, 0);
fnNumberOutline = font_add_sprite_ext(sNumbersOutlined, _numString, true, 0);

//Deck Builder
fnDBLetter = font_add_sprite_ext(sDBLetters,"ABCDEFGHIJKLMNOPQRSTUVWXYZ|:",true,0);
fnDBNumber = font_add_sprite_ext(sDBNumbers,"/0123456789",true,0);

//Trophy
fnTRNumber = font_add_sprite_ext(sTRFont, "0123456789", true, -3);

//Break Room
fnBreakRoom = font_add_sprite_ext(sBRFont,"ABCDEFGHIJKLMNOPQRSTUVWXYZ !",true,-.5);

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
global.menuOpen = false;
global.timeSources = [];

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
SaveFile(); //Setup Save File System
SaveFile.GameLoad();
SaveFile.SettingsLoad();

//Set Window
setWindowToRes();


//Load Game Version
gameVersion = "";
if GM_build_type == "run"
{
    var _date = date_current_datetime();
    var _version = $"{date_get_year(_date)}.{date_get_month(_date)}.{date_get_day(_date)}.{date_get_hour(_date)}";

    var _file = file_text_open_write("GameVersion.kaos");
    file_text_write_string(_file, _version);
    file_text_close(_file);

    gameVersion = _version;
} else if file_exists("GameVersion.kaos")
{
    var _file = file_text_open_read("GameVersion.kaos");
    gameVersion = file_text_read_string(_file);
    file_text_close(_file);
}