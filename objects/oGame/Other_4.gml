///@desc Set Events

//Round Started
if room == rPrepare
{
	eventNextRoundStarted();
}

//Kaos Started
if room == rKaos
{
    eventKaosRoundStarted();
}

//Give Reward
//global.tourneyReward = tourneyInfo.debut
if room == rTournies and global.tourneyReward != undefined and !array_contains(global.tourneysBeaten,global.tourneyReward)
{
    //Get All Cards
    var _allCards = [];
    for (var i = 0; i < array_length(global.tourneyReward.enemies); i++) {
        //Get Enemy
        var _enemy = global.tourneyReward.enemies[i];
        
        
        //Remove Duplicates
        var _cards = [];
        for (var k = 0; k < array_length(_enemy.rewards); k++) {
            
            if !array_contains(_cards,_enemy.rewards[k])
            {
                array_push(_cards,_enemy.rewards[k]);
            }
        }
        
        //Combine Cards
        for (var k = 0; k < array_length(_cards); k++) {
            if !array_contains(_allCards,_cards[k])
            {
                array_push(_allCards,_cards[k]);
            }
        }
    }
    
    //Create Rewards
    timeSourceCreate(3,function(_cards,_tourney){
        
        instance_create_layer(0,0,"Ui",oReward,{
            cards : _cards,
            extra : _tourney.rewards,
            tourney : _tourney
        });
    },[_allCards,global.tourneyReward],time_source_units_frames);
    
    //Set Tournament As Beaten
    array_push(global.tourneysBeaten,global.tourneyReward);
    
    //Give Break Room Items
    global.BRItems = array_concat(global.BRItems,global.tourneyReward.items);
    
    //Set Tourney Reward
    global.tourneyReward = undefined;
}