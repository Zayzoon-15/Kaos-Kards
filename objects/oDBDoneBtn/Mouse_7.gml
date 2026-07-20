//Start Transition
if canPress and pressed
{
    var _room = variable_global_get("DBSavedRoom");
    
    if _room == rBreakRoom
    {
        transStart(rBreakRoom);
    } else {
    	transStart(_room,oTransSticker);
    }
}