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