//Stick To Screen
x = global.stickItemsToScreen ? getPosToWindow(false) : xstart;

//Touching
if (touchingMouse() and !global.menuOpen and !global.midTrans) or image_speed == 1
{
    //Hover
    if !hover
    {
        
        //Set Hover
        hover = true;
    }
    
    //Start Press
    if mouse_check_button_pressed(mb_left) then pressed = true;
    
    //Pressed
    if mouse_check_button_released(mb_left) and pressed and !global.menuOpen
    {
        //Animate
        image_index = 0;
        image_speed = 1;
        
        //Stop Other Events
        global.menuOpen = true;
        
        //Action
        timeSourceCreate(10,function()
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
            
        },[],time_source_units_frames);
    }
    
    //Scale
    scale = lerp(scale,1.08,.2);
    shadowScale = lerp(shadowScale,.95,.2);
    
    //Shadow
    shadowY = lerp(shadowY,7,.2);
    shadowX = lerp(shadowX,0,.2);
    
    //Outline
    outlineAlpha = lerp(outlineAlpha,1.0,.2);
} else {
    
    //Press
    pressed = false;
    hover = false;
    
    //Scale
    scale = lerp(scale,1,.2);
    shadowScale = lerp(shadowScale,1,.2);
    
    //Shadow
    shadowY = lerp(shadowY,7,.2);
    shadowX = lerp(shadowX,0,.2);
    
    //Outline
    outlineAlpha = lerp(outlineAlpha,0.0,.2);
}
