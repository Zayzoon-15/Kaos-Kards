//Get Values
var _scale = window_get_height()/baseH;
var _targetH = window_get_height()/_scale;
var _targetWidth = window_get_width()/_scale;

//Set Camera Size
camH = baseH;
camW = _targetWidth;

//Set Camera Position
var _camX = room_width/2-camW/2;
var _camY = 0;

//Set Gui
display_set_gui_size(camW,camH);

//Exit if Minimized
if _scale <= 0 then exit;

//Set Camera Values
camera_set_view_pos(view_camera[0],_camX,_camY);
camera_set_view_size(view_camera[0],camW,camH);