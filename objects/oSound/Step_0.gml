//Update Listener Position
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;
audio_listener_position(_x,_y,0); //Set Pos
audio_listener_set_orientation(0, 0, 0, 1000, 0, -1, 0); //DONT TOUCH