// Inherit the parent event
event_inherited();

//Page
curPage = 1;

//Button
canHover = room != rTournies;

//Info
drawInfo = false;

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Return To Menu";

//Size
setSize(3,.85);

//Action
action = function()
{
    transStart(rTournies);
    timeSourceCreate(15,function(){
        oPause.unpauseGame();
    },[],time_source_units_frames);
}