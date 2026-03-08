//Disabled Rooms (Rooms where pause menu can not be opened)
disabledRooms = [rSetup];

//Screenshot
screenshot = undefined;

//Settings
settingsLastButton = 0;

//Mobile
mobilePos = new Vector2();
mobileRad = 60;
mobilePressed = false;

//Song
lastSong = noone;
lastSongLoops = 0;
lastSongPos = 0;

//Functions
pauseGame = function()
{
    //Pause
    global.paused = true;
    depth = -1;
    
    //Create Screen Shot
    screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),false,false,0,0);
    
    //Last Song Info
    lastSongLoops = oSound.loops;
    lastSongPos = audio_sound_get_track_position(global.curSongAudio);
    lastSong = global.curSong;
    
    //Stop Songs
    audioPlaySong(noone,30,"Pause");
    
    #region Deactiveate
	audio_group_stop_all(agSfx);
	instance_deactivate_all(true);
	instance_activate_object(oGame);
	instance_activate_object(oExpandRes);
    instance_activate_object(oSound);
    instance_activate_object(oSubtitle);
    
	#endregion
    
    var _offset = 100;
    var _center = ROOM_CENTER.y + 30;
    instance_create_depth(ROOM_CENTER.x,_center-_offset,depth-1,oPauseResume);
    instance_create_depth(ROOM_CENTER.x,_center,depth-1,oPauseSettings);
    instance_create_depth(ROOM_CENTER.x,_center+_offset,depth-1,oPauseReturn);
}

unpauseGame = function()
{
    //Unpause
    global.paused = false;
    
    //Replay Song
    audioPlaySong(lastSong,30,"Stop",true,{pos:lastSongPos,loops:lastSongLoops});
    
    //Destroy Menu
    instance_destroy(oPauseResume);
    instance_destroy(oPauseReturn);
    instance_destroy(oPauseSettings);
    
    //Activate
    audio_resume_all();
	instance_activate_all();
}