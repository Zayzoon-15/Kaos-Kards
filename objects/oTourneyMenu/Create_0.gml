#region --- Tourney Info ---

//Setup
allTournies = [];
curTourney = tourneyInfo.debut;
tourneyNum = 0;

//Get Tournies
var _tournies = variable_struct_get_names(tourneyInfo);
array_sort(_tournies,function(_cur,_next)
{
    return struct_get(tourneyInfo,_next).placement - struct_get(tourneyInfo,_cur).placement;
})

//Fill Tourney Array
for (var i = 0; i < array_length(_tournies); i++) {
	array_push(allTournies,struct_get(tourneyInfo,_tournies[i]));
}


/// @desc Changes the tournaments info
/// @param {real} [_dir] The value to change the number by (Default : 1)
/// @param {any*} [_setTo] If not set to undefined it will set the tournament info to that value
changeTourney = function(_dir = 1,_setTo = undefined)
{
    //Set Number
    tourneyNum += _dir;
    
    //Loop
    if tourneyNum >= array_length(allTournies) then tourneyNum = 0;
    if tourneyNum < 0 then tourneyNum = array_length(allTournies)-1;
    
    //Set Tournament
    curTourney = allTournies[tourneyNum];
    if _setTo != undefined
    {
        curTourney = _setTo;
        tourneyNum = 0;
    }
    
    print("SET TOURNEY TO", curTourney.name);
    
    //Set Vars
    global.currentTourney = curTourney;
    
    //Change Visuals
    oTourneyMenuRules.change(curTourney,_dir);
    oTourneyMenuPaper.change(curTourney,_dir);
}
changeTourney(0,curTourney);

#endregion