function animManager(_info = enemyInfo.dog) constructor {

    //Get Info
    parent = other.id;
    
    //Vars
    animInfo = _info.animInfo;
    frame = 0;
    currentAnim = 0;
    animationEnd = false;
    shake = 0;
    ignoreTime = 0;
    resetAnim = "";
    
    
    //Functions
    static update = function()
    {
        if currentAnim != undefined
        {
            //Update Frame
            frame += sprite_get_speed(parent.sprite_index) / 60;
            
            if frame >= currentAnim.length 
            {
                if currentAnim.loop 
                {
                    frame -= currentAnim.length;
                } else {
                	//frame = currentAnim.length - 1;
                    
                    if !animationEnd
                    {
                        var _array = struct_get_names(animInfo);
                        for (var i = 0; i < array_length(_array); i++) {
                        	var _struct = struct_get(animInfo,_array[i]);
                            
                            //Play Animation
                            if _struct == currentAnim and !_struct.loop 
                            {
                                play(_struct.resetAnim);
                            }
                        }
                    }
                }
                
                animationEnd = true;
                
            }
            
            //Apply Frame
            parent.image_index = currentAnim.start + frame;
        }
        
        if ignoreTime > 0
        {
            ignoreTime --;
        } else if resetAnim != ""
        {
            play(resetAnim);
            resetAnim = "";
        }
    }
    
    static play = function(_anim = "idle",_resetAnim = "",_ignoreTime = 0)
    {
        //Animation Does Not Exist
        if !variable_struct_exists(animInfo,_anim)
        {
            print($"'{_anim}' Does Not Exist");
            exit;
        }
        
        //Get Clip
        var _clip = variable_struct_get(animInfo, _anim);
        
        //Switch Animation
        if _clip != undefined and currentAnim != _clip and ignoreTime <= 0
        {
            currentAnim = _clip;
            frame = 0;
            animationEnd = false;
            ignoreTime = _ignoreTime;
            resetAnim = _resetAnim;
        }
    }
}