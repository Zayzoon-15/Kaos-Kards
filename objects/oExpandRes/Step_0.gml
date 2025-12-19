//Get Window Size
var _winW = window_get_width();
var _winH = window_get_height();

//Exit if Minimized or Invalid
if _winW <= 0 or _winH <= 0 then exit;

//Get Scale Based on Height
var _scale = _winH / baseH;

//Get Width
var _targetWidth = _winW / _scale;

//Set Camera Size
camW = _targetWidth;
camH = baseH;

//Get Camera Position
var _camX = room_width/2 - camW/2;
var _camY = 0;

//Set GUI Size
//display_set_gui_size(baseW, baseH);

//Resize Screen
if _winW >= baseW * _scale and _winW >= 200 and _winH >= 200
{
    if surface_exists(application_surface) 
    {
        //Resize Surface
        surface_resize(application_surface, round(camW), round(camH));
        
        //Set Camera
        camera_set_view_pos(view_camera[0], _camX, _camY);
        camera_set_view_size(view_camera[0], camW, camH);
    }
} else {
    
    //Resize
	surface_resize(application_surface, baseW, baseH);
    
    //Set Camera
    _camX = room_width/2 - baseW/2;
    camera_set_view_pos(view_camera[0], _camX, _camY);
    camera_set_view_size(view_camera[0], baseW, baseH);
}

