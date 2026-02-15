//Disabled Rooms (Rooms where settings can not be opened)
disabledRooms = [rSetup,rDeckBuilder1,rDeckBuilder2];

//Screenshot
screenshot = undefined;

//Settings
settingsLastButton = 0;

//Mobile
mobilePos = new Vector2();
mobileRad = 60;
mobilePressed = false;

//Functions
pauseGame = function()
{
    global.paused = true;
    
    screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),false,false,0,0);
    
    #region Deactiveate
	//audio_pause_all();
	audio_group_stop_all(agSfx);
	instance_deactivate_all(true);
	instance_activate_object(oGame);
	instance_activate_object(oExpandRes);
    instance_activate_object(oSound);
    instance_activate_object(oSubtitle);
	
	#endregion
    
    var _offset = 100;
    instance_create_depth(ROOM_CENTER.x,ROOM_CENTER.y-_offset,depth-1,oPauseResume);
    instance_create_depth(ROOM_CENTER.x,ROOM_CENTER.y,depth-1,oPauseSettings);
    instance_create_depth(ROOM_CENTER.x,ROOM_CENTER.y+_offset,depth-1,oPauseReturn);
}

unpauseGame = function()
{
    global.paused = false;
    
    instance_destroy(oPauseResume);
    instance_destroy(oPauseReturn);
    instance_destroy(oPauseSettings);
    
    //Activate
    audio_resume_all();
	instance_activate_all();
}