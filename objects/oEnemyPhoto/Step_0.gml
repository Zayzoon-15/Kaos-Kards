
//Play Animation
loopMultAnims(currentAnim,4);

//Draw Info
drawTipBox(global.currentEnemy.name, false);

//Move To Correct Position
var _camRight = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]);
x = _camRight - (room_width - xstart);