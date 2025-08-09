
var _width = window_get_width();
var _height = window_get_height();

if (_width != oldWidth or _height != oldHeight) {

    event_user(0); 

    oldWidth = _width;
    oldHeight = _height;
}