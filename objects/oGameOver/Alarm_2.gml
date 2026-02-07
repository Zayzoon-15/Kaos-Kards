///@desc Player Death

//Play Explosion Sound
audioPlaySfx(snExplosion,.9,1.1);
	
//Create Explosions
repeat 6
{
	var _margin = 100;
	var _x = random_range(camera_get_view_x(view_camera[0])+_margin,camera_get_view_width(view_camera[0])-_margin);
	var _y = random_range(camera_get_view_y(view_camera[0])+_margin,camera_get_view_height(view_camera[0])-_margin);
	effectExplosion(_x,_y,false,3.5);
}

//Repeat
if !deathDone then alarm[2] = 10;
