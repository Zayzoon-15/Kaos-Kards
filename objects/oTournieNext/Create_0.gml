// Inherit the parent event
event_inherited();

//Button
canHover = true;
drawInfo = false;

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = dir == "Left" ? "Last Page" : "Next Page";

//Action
action = function()
{
    oTournies.selected = false;
    global.currentEnemy = undefined;
    
    //Hide Other Layers
    layer_set_visible("Page1",false);
    layer_set_visible("Page2",false);
    
    //Change Page
    var _dir = dir == "Left" ? -1 : 1;
    oTournieStart.curPage += _dir;
    
    //Loop Page
    if oTournieStart.curPage > 2 then oTournieStart.curPage = 1;
    if oTournieStart.curPage < 1 then oTournieStart.curPage = 2;
    
    //Show Layer
    var _layer = layer_get_id($"Page{oTournieStart.curPage}");
    layer_set_visible(_layer,true);
    
    //Juice
    oTournies.xscale = .5;
    oTournies.yscale = .5;
}