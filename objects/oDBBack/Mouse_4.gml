if !canPress then exit;

//Set Transition
with oDeckBuilder
{
    transition = true;
    TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,25,"transSpd",0,50);
}

//Change
timeSourceCreate(15,function(){
    
    if room == rDeckBuilder1
    {
        transStart(rDeckBuilder2);
    } else {
        transStart(rDeckBuilder1);
    }
    
},[],time_source_units_frames);