//Get Window Size
var _winW = window_get_width();
var _winH = window_get_height();

//Exit if Minimized or Invalid
if (_winW <= 0 || _winH <= 0) exit;

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
display_set_gui_size(baseW, baseH);

//Resize Surface
if surface_exists(application_surface) and _winW >= baseW and _winH >= baseH 
{
    surface_resize(application_surface, round(camW), round(camH));
}

//Set Camera
camera_set_view_pos(view_camera[0], _camX, _camY);
camera_set_view_size(view_camera[0], camW, camH);