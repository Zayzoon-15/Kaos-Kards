/**
	This function contains the full setup definition for your Figgy configuration.
	• All Setup-related methods MUST be called inside. Calling them ouside will throw an error.
	• Figgy calls this function automatically during initialization.
	• Do NOT rename, delete or call it yourself. Doing so will break initialization.
	• Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
*/
function FiggySetup() {
	
    Figgy.Window("Game Info",false,FIGGY_WINDOW_DEFAULT_X,40,FIGGY_WINDOW_DEFAULT_WIDTH,300);
        Figgy.Section("Enemy");
        Figgy.String("Current Enemy", "dog", function(){
            if struct_exists(enemyInfo,argument0) {
                global.currentEnemy = struct_get(enemyInfo,argument0);
                with oEnemyPhoto {sprite_index = global.currentEnemy.sprite;}
            }});
        Figgy.Int("Enemy Frame",0,0,3,1,function(){with oEnemyPhoto {currentAnim = argument0}});
        
        Figgy.Section("Rooms");
        Figgy.Button("Reset Room",function(){room_restart()});
        Figgy.Button("Prepare",function(){room_goto(rPrepare)});
        Figgy.Button("Enemy",function(){room_goto(rEnemy)});
    
    Figgy.Window("Health Bar",false,FIGGY_WINDOW_DEFAULT_X,40,FIGGY_WINDOW_DEFAULT_WIDTH,400);
        Figgy.Section("Player");
        Figgy.Int("Health",100,0,100,FIGGY_INT_DEFAULT_STEP,function(){global.playerHp = argument0;});
        Figgy.Button("Apply Shield",function(){addEffect(attackEffects.shield,10,false)});
        Figgy.Button("Apply Poison",function(){addEffect(attackEffects.poison,10,false)});
        Figgy.Button("Apply Fire",function(){addEffect(attackEffects.fire,10,false)});
        
        Figgy.Section("Enemy");
        Figgy.Int("Health",100,0,100,FIGGY_INT_DEFAULT_STEP,function(){global.enemyHp = argument0;});
        Figgy.Button("Apply Shield",function(){addEffect(attackEffects.shield,10,true)});
        Figgy.Button("Apply Poison",function(){addEffect(attackEffects.poison,10,true)});
        Figgy.Button("Apply Fire",function(){addEffect(attackEffects.fire,10,true)});
}
