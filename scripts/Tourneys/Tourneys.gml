
/// @desc Creates a new tournament
/// @param {string} [_name] The tournaments name
/// @param {asset.gmsprite} [_art] The tournaments art
/// @param {array<any>} [_enemies] All the enemies for the tournament
/// @param {array<struct.rule>} [_rules] The tournaments rules
/// @param {real} [_timeLimit] The time limit of the tournament in minutes
/// @param {array<Asset.GMObject>} [_items] The items the player recieves after winning (Shows up in the break room)
/// @param {array<Asset.GMObject>} [_rewards] The reward the player recieves after winning (Shows up in the reward ui)
function createTourney(_name = "Tourney Name",_art = sTourneyArtBorder,_enemies = [enemyInfo.dog],_rules = [ruleInfo.deckShuffle],_timeLimit = -1,_items = [],_rewards = []) constructor {
    
    //Info
    name = _name;
    sprite = _art;
    enemies = _enemies;
    
    //Rules
    rules = _rules;
    timeLimit = _timeLimit * 60;
    
    //Items
    items = is_array(_items) ? _items : [_items];
    rewards = is_array(_rewards) ? _rewards : [_rewards];
    
    //Set Placement
    placement = global._tourneyPlacement;
    global._tourneyPlacement ++;
}


function initTourney(){
    
    //Set Up Vars
    globalvar tourneyInfo;
    global._tourneyPlacement = 0;
    global.currentTourney = undefined;
    global.tourneyEnemiesBeaten = 0;
    global.BRItems = [oBRBeanbag];
    global.gaveReward = false;
    global.tourneyReward = undefined;
    global.tourneysBeaten = [];
    
    //Init Rules
    initRules();
    
    //Info
    tourneyInfo = {
        
        debut : new createTourney("Debut Tournament", sTourneyArt1, [
            enemyInfo.dog, enemyInfo.cock, enemyInfo.angel,
            enemyInfo.alien, enemyInfo.beer
        ], [], -1, [oBRShop,oBRPickle]),
        
        retro : new createTourney("Retro Tournament", sTourneyArt2, [
            enemyInfo.handsy, enemyInfo.chud,
        ], [
            ruleInfo.deckShuffle, ruleInfo.timeLimit
        ], 5, [oBRTv,oBRWand]),
        
        spooky : new createTourney("Spooky Tournament", sTourneyArt3, [
            enemyInfo.bones, enemyInfo.fungi,
        ], [
            ruleInfo.deckShuffle, ruleInfo.timeLimit
        ], 1.5),
        
        cameos : new createTourney("Extras", sTourneyArt4, [
            enemyInfo.jsg, enemyInfo.pug, enemyInfo.fungi, enemyInfo.bf,
            enemyInfo.teto,
        ],[
            ruleInfo.deckShuffle, ruleInfo.timeLimit
        ], 1, [oBRBoombox]),
        
    }
    
    
}