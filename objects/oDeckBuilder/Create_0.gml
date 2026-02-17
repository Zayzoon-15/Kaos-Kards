//Transition
transition = false;

//Image
sprite = undefined;
xOffset = 0;

//Properties
spriteScale = 1;
spriteX = 0;
spriteY = 0;

//Play Song
var _song = room == rDeckBuilder1 ? sgDeckBuilder1 : sgDeckBuilder2;
audioPlayGroupSong(global.musicGroups.deck,_song);

//Start Transition
startTrans = function()
{
    //Set Transition
    transition = true;
    
    //Set Position
    spriteX = CAMERA_POS.x;
    xOffset = room == rDeckBuilder1 ? oDBInsertHole.x - CAMERA_POS.x : oDBInsertHole.x - CAMERA_POS.x;
    
    //Set Sprite
    sprite = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),false,false,xOffset,0);
    depth = -100;
    
    //Animate
    var _ease = EaseInCubic;
    var _dur = 30;
    TweenFire(self,_ease,TWEEN_MODE_ONCE,false,0,_dur,"spriteScale",1,2.3);
    TweenFire(self,_ease,TWEEN_MODE_ONCE,false,0,_dur,"spriteY",0,-(oDBInsertHole.y+100));
    
    //Change Room
    timeSourceCreate(_dur*.3,function(){
        
        if room == rDeckBuilder1
        {
            transStart(rDeckBuilder2);
        } else {
            transStart(rDeckBuilder1);
        }
        
    },[],time_source_units_frames);
}