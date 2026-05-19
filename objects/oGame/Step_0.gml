//Fullscreen
if keyCheckPressed(global.keyFullscreen)
{
	window_set_fullscreen(!window_get_fullscreen());
    
    //Set Correct Window
    if window_get_showborder()
    {
        global.window = "Window";
    } else global.window = "Borderless";
    global.window = window_get_fullscreen() ? "Fullscreen" : global.window;
}

//Game Rules
if array_contains([rPrepare,rKaos],room) and global.currentTourney != undefined
{
    //Get Rules
    var _rules = global.currentTourney.rules;
    for (var i = 0; i < array_length(_rules); i++) {
    	if _rules[i].event == ACTION_EVENTS.STEP
        {
            _rules[i].action();
        }
    }
}