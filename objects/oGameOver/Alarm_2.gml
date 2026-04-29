///@desc Player Death


//Create Explosions
if global.explosionsAfter
{
    //Play Explosion Sound
    audioPlaySfx(snExplosion,.9,1.1);
    
    repeat 6
    {
    	var _margin = 100;
    	var _x = random_range(camera_get_view_x(view_camera[0])+_margin,camera_get_view_width(view_camera[0])-_margin);
    	var _y = random_range(camera_get_view_y(view_camera[0])+_margin,camera_get_view_height(view_camera[0])-_margin);
    	effectExplosion(_x,_y,false,3.5);
    }
} else {
    //effectExplosion(125,ROOM_CENTER.y,false,12);
    //effectExplosion(ROOM_CENTER.x,ROOM_CENTER.y,false,12);
    //effectExplosion(1100,ROOM_CENTER.y,false,12);
}

//Repeat
if !deathDone and global.explosionsAfter then alarm[2] = 10;
