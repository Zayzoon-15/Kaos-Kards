// Inherit the parent event
event_inherited();

//Page
curPage = 1;

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
    transStart(rTournies);
    timeSourceCreate(15,function(){
        oPause.unpauseGame();
    },[],time_source_units_frames);
}