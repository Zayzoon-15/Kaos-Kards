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
    var _chance = global.miniBossesBeaten < 2 ? irandom_range(1,10) : 0;
    
    //Go To Room
    global.menuOpen = false;
    transStart(rPrepare);
    eventGameReset(false);
    
    print("MINI BOSSES",global.currentTourney.miniBosses);
    print("LAST WAS MINI",global.lastWasMini);
    print("ENMIES BEATEN",global.tourneyEnemiesBeaten);
    print("CHANCE",_chance);
    
    //Do Miniboss
    if _chance == 1 and global.currentTourney.miniBosses and global.tourneyEnemiesBeaten > 0 and !global.lastWasMini
    {
        print("DO MINI BOSS")
        
        //Setup Enemy Lists
        var _enemyList = struct_get_names(enemyInfo);
        var _targetEnemies = [];
        
        //Get A Random Enemy
        for (var i = 0; i < array_length(_enemyList); i++) {
            var _enemyInfo = struct_get(enemyInfo,_enemyList[i]);
        	if !array_contains(global.currentTourney.enemies,_enemyInfo) and _enemyInfo.special == undefined
            {
                array_push(_targetEnemies,_enemyList[i]);
                
                //In here later we can change it so u can only fight enemies you have fought before
            }
        }
        
        //Set Info
        global.isMiniBoss = true;
        global.lastWasMini = true;
        global.currentEnemy = struct_get(enemyInfo,array_get_random(_targetEnemies)); //Get Random Enemy
    } else global.lastWasMini = false;
    
}