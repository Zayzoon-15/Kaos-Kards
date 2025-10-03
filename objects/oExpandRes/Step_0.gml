
//Get Scale
var _scale = window_get_height()/baseH;
var _targetWidth = window_get_width()/_scale;

//Set Camera Size
camW = _targetWidth;
camH = baseH;

//Clamp
camW = clamp(camW,0,7945);

//Size Gui
display_set_gui_size(camW,camH);

//Get Camera Pos
var _camX = room_width/2-camW/2;
var _camY = 0;

//Resize
if surface_exists(application_surface)
{
	if camW > 0 and camH > 0 then surface_resize(application_surface,camW,camH);
}

//Set Camera Values
camera_set_view_pos(view_camera[0],_camX,_camY);
camera_set_view_size(view_camera[0],camW,camH);
