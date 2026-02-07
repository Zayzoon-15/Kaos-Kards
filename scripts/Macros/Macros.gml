
//Ui
#macro UIBOX_RAD 4
#macro UIBOX_ALPHA .6 

//Drawing
#macro SHADOW_ALPHA .7

//Screen
#macro ROOM_CENTER new Vector2(room_width/2,room_height/2)
#macro SCREEN_WIDTH camera_get_view_width(view_camera[0])
#macro SCREEN_HEIGHT camera_get_view_height(view_camera[0])
#macro CAMERA_POS new Vector2(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
#macro SCREEN_EDGE {left: camera_get_view_x(view_camera[0]), right: camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])} 