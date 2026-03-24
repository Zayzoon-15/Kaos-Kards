// Inherit the parent event
event_inherited();

//Button
canHover = room != rTournies;

//Info
drawInfo = false;
text = "Return To Menu";

//Text
sizeToText = true;
textXScale = 0;
textScaleTime = .2;
scaleTime = .3;

//Action
action = function()
{
    if global.paused
    {
        //Stop All Music
        audio_group_stop_all(agMusic);
        instance_destroy(oSongTracker);
        
        //Go To Menu
        transStart(rTournies);
        timeSourceCreate(20,function(){
            oPause.unpauseGame();
        },[],time_source_units_frames);
    }
}