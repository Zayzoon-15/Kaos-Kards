//Set Position
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

//Reduce Flash
flashAlpha = lerp(flashAlpha,flashTarget,flashSpd);