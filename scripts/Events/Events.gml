
/// @desc  This event plays when the player resets the match
/// @param {bool} [_hardReset] If on it resets the game fully as if the tournament reset
/// While off it resets the game as if finished fighting an enemy
function eventGameReset(_hardReset = true)
{	
    //Hard Resets
    if _hardReset
    {
        //Set Seed
        randomise();
        random_set_seed(random(999999),true);
        print("Game Seed",random_get_seed());
        
        //Set Tourney
        global.tourneyEnemiesBeaten = 0;
    }
    
	//Set Gamestate
	gameState = GAMESTATES.PREPARE;
	
    //Reset Round
    global.gameRound = 0;
    
    //Set Rewards For Break Room
    global.gaveReward = false;
    
    //Reset Uses
    global.enemySpecialUses = 0;
    
	//Destroy All Effects
	instance_destroy(oAttackEffect);
	instance_destroy(oHealthIconExit);
	ds_map_clear(playerEffects);
	ds_map_clear(enemyEffects);
    global.healEffects = {
        player: [],
        enemy : []
    }
	
	//Reset Combo
	global.playerComboMeter = 0;
	global.enemyComboMeter = 0;
	
	//Reset Health Bar
    global.playerMaxHp = 100;
    global.enemyMaxHp = global.currentEnemy != undefined ? global.currentEnemy.difficulty.maxHp : 100;
	global.playerHp = global.playerMaxHp;
	global.playerTempHp = 0;
	global.playerHpIcons = [];
	global.enemyHp = global.enemyMaxHp;
	global.enemyTempHp = 0;
	global.enemyHpIcons = [];
	
	//Remove Actions
	ds_list_clear(playerActions);
	ds_list_clear(enemyActions);
	
	//Reset Values
	global.valueMult = 1;
    global.comboMult = 1;
    global.repeatTimes = 0;
    global.discards = 0;
	
	//Reset Slots
    global.disabledSlots = {
        player: array_create(4,false),
        enemy : array_create(4,false)
    };
    
    //Reset Uses
    global.cardUses = {
        player: [],
        enemy : []
    };
	
	//Reset Log
	ds_list_clear(global.gamelog);
    
    //Removed
    global.playerRemovedCards = [];
    global.enemyRemovedCards = [];
    global.playerAddCards = [];
    global.enemyAddCards = [];
    
    //Reset Hand Size
    global.maxHandSize = 6;
    global.maxDiscards = round(array_length(playerDeck)*.6);
    
    //Audio
    ds_list_clear(global.songIntrosPlayed); //Clear Song Intros
	ds_map_clear(global.songsPaused); //Clear Songs Paused
    
    //Apply Rules
    if room == rPrepare and global.currentTourney != undefined
    {
        var _rules = global.currentTourney.rules;
        for (var i = 0; i < array_length(_rules); i++) {
        	if _rules[i].event == ACTION_EVENTS.MATCH_START
            {
                _rules[i].action();
            }
        }
    }
}


///@desc This event plays when the next round starts
function eventNextRoundStarted()
{
    //Set Gamestate
    gameState = GAMESTATES.PREPARE;
    
    //Enemy Show
    if global.gameRound == 0 and global.currentTourney != undefined
    {
        instance_create_depth(0,0,-1,oEnemyIntro);
    }
    
    //Increase Round
    global.gameRound ++;
    print("Game Round",global.gameRound)
    
    //Remove Actions
    ds_list_clear(playerActions);
    ds_list_clear(enemyActions);
    
	//Reduce Assist Effects
	attackEffectReduce(NaN,10,true);
	attackEffectReduce(NaN,10,false);
    global.healEffects = {
        player: [],
        enemy : []
    }
	
	//Reset Mult
	global.valueMult = 1;
    global.comboMult = 1;
    global.repeatTimes = 0;
    
    //Decrease Discards
    global.discards -= .3;
    global.discards = clamp(global.discards,0,global.maxDiscards);
    
    //Reset Performance
    global.playerPerformance = 0;
    global.enemyPerformance = 0;
    
    //Apply Rules
    if global.currentTourney != undefined
    {
        var _rules = global.currentTourney.rules;
        for (var i = 0; i < array_length(_rules); i++) {
        	if _rules[i].event == ACTION_EVENTS.EVERY_ROUND
            {
                _rules[i].action();
            }
        }
    }
    
}


///@desc This event plays when the kaos part of the match starts
function eventKaosRoundStarted()
{
    //Set Gamestate
    gameState = GAMESTATES.KAOS;
    
    //Reset Slots
    global.disabledSlots = {
        player: array_create(4,false),
        enemy : array_create(4,false)
    };
}


///@desc This event plays when the played kaos card is complete
function eventKaosCardDone()
{
    //Destroy Kaos Card
    with oAttackCard
    {
        if card.info.type == CARDTYPES.KAOS
        {
            //Stars
            effectStar(x,y,10,true,20,25);
            
            //Destroy
            instance_destroy();
        }
    }
    
    //Next Kaos
	if instance_exists(oKaosManager) then oKaosManager.alarm[0] = 50;
}


///@desc This event plays when the played combo attack is complete
function eventComboAttackDone()
{
    //Destroy Kaos Card
    with oAttackCard
    {
        if combo
        {
            //Stars
            effectStar(x,y,10,true,20,25);
            
            //Destroy
            instance_destroy();
        }
    }
    
    //Voiceover
    audioPlayVoice(voicePack.combo,false);
    
    //Next Kaos
    if instance_exists(oKaosManager) then oKaosManager.alarm[5] = 50;
}


/// @desc This event plays when all cards gain their value
function eventAllCardValuesGained()
{
    //Vampire Card Activate
    if instance_exists(oVampire)
    {
        oVampire.alarm[0] = 30;
        exit;
    }
    
    
    //Set Done Button
    instance_destroy(oDonePrepButton);
}


/// @desc This event plays when a room transition has occured
///Note that this event plays a few frames before the room switches
/// @param {asset.gmroom} [_nextRoom] The room transitioned to
/// @param {asset.gmroom} [_lastRoom] The room before the transition
function eventTransitioned(_nextRoom = global.roomTarget,_lastRoom = room)
{


}