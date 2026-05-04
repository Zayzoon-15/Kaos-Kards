
/// @desc Creates a new tournament
/// @param {string} [_name] The tournaments name
/// @param {asset.gmsprite} [_art] The tournaments art
/// @param {array<any>} [_enemies] All the enemies for the tournament
/// @param {array<struct.rule>} [_rules] The tournaments rules
/// @param {real} [_timeLimit] The time limit of the tournament in seconds (5 * 60 = 5 Minutes)
/// @param {array<Asset.GMObject>} [_items] The items the player recieves after winning
function Tourney(_name = "Tourney Name",_art = sTourneyArtBorder,_enemies = [enemyInfo.dog],_rules = [ruleInfo.deckShuffle],_timeLimit = 5*60,_items = []) constructor {
    
    //Info
    name = _name;
    sprite = _art;
    enemies = _enemies;
    
    //Rules
    rules = _rules;
    timeLimit = _timeLimit;
    
    //Item
    items = is_array(_items) ? _items : [_items];
    
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
    global.BRItems = [oBRPickle,oBRShop];
    
    //Init Rules
    initRules();
    
    //Info
    tourneyInfo = {
        
        debut : new Tourney("Debut Tournament", sTourneyArt1, [
            enemyInfo.dog, enemyInfo.angel, enemyInfo.cock,
            enemyInfo.alien, enemyInfo.beer
        ], [], 0, [oBRShop,oBRPickle]),
        
        retro : new Tourney("Retro Tournament", sTourneyArt2, [
            enemyInfo.handsy, enemyInfo.chud,
        ], [
            ruleInfo.deckShuffle, ruleInfo.timeLimit
        ], 5 * 60, [oBRTv,oBRWand]),
        
        spooky : new Tourney("Spooky Tournament", sTourneyArt3, [
            enemyInfo.bones, enemyInfo.fungi,
        ], [
            ruleInfo.deckShuffle, ruleInfo.timeLimit
        ], 5 * 60),
        
        cameos : new Tourney("Extras", sTourneyArt4, [
            enemyInfo.jsg, enemyInfo.pug, enemyInfo.fungi,
            enemyInfo.teto,
        ],[
            ruleInfo.deckShuffle, ruleInfo.timeLimit
        ], 5 * 60, [oBRBoombox]),
        
    }
    
    
}