

//Resolution
var _window_width = window_get_width();
var _window_height = window_get_height();

var _width = 960;
var _height = 540;

var _resScale = window_get_width() / _width;


//Enable Views
view_enabled = true;
view_visible[0] = true;

//Create Camera
var _camera = camera_create_view(0, 0, _width, _height);
view_set_camera(0, _camera);

//Resize Surface
surface_resize(application_surface, _width * _resScale, _height * _resScale);//
display_set_gui_size(_width, _height);