//Mouse
hover = false;
pressed = false;

//Animate
image_speed = 0;
image_index = image_number - 1;

//Image
scale = 1;
angle = 0;
outlineAlpha = 0;
angleDir = 0;

//Shadow
shadowScale = 1;
shadowY = 7;
shadowX = 0;

//Action
action = function()
{
    //Change Enemy
    global.currentEnemy = global.currentTourney.enemies[global.tourneyEnemiesBeaten];
    
    //Check If Miniboss
    var _chance = global.miniBossesBeaten < 2 ? irandom_range(1,1) : 0;
    
    //Go To Room
    global.menuOpen = false;
    transStart(rPrepare);
    eventGameReset(false);
    
    //Do Miniboss
    if _chance == 1 and global.currentTourney.miniBosses
    {
        //Get Random Enemy
        var _enemyList = struct_get_names(enemyInfo);
        var _targetIndexs = [];
        
        for (var i = 0; i < array_length(_enemyList); i++) {
            
            for (var k = 0; k < array_length(global.currentTourney.enemies); k++) {
                //Has Same Enemies
                if global.currentTourney.enemies[k].name == struct_get(enemyInfo,_enemyList[i]).name
                {
                    array_push(_targetIndexs,i);
                }
            }
            
            //Delete If Boss
            if struct_get(enemyInfo,_enemyList[i]).special != undefined
            {
                array_push(_targetIndexs,i);
            }
        }
        
        //Delete Indexs
        for (var i = 0; i < array_length(_targetIndexs); i++) {
            array_delete(_enemyList,_targetIndexs[i],1);
        }
        delete _targetIndexs;
        
        global.isMiniBoss = true;
        global.currentEnemy = struct_get(enemyInfo,array_get_random(_enemyList)); //Get Random Enemy
    }
    
}