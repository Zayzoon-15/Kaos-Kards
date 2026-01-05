#region Draw Settings Bg

if global.paused
{
	//Draw Bg
	draw_set_color(#777777);
	var _x1 = camera_get_view_x(view_camera[0]);
	var _x2 = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]);
	draw_rectangle(_x1,0,_x2,room_height,false);

	//Draw Cards
	draw_set_color(c_white);
	draw_set_alpha(.5);
	draw_sprite_tiled(sSettingsCards,0,0,bgY);
	bgY += 0.2;

	//Reset Draw
	drawReset();
    
    //Draw Guys
    draw_self();
}

#endregion

//Draw Mobile Button
if global.mobile and !global.paused
{
	//Draw Circle
	draw_set_colour(c_gray);
	draw_set_alpha(.5);
	draw_circle(mobilePos.x,mobilePos.y,mobileRad,false);
	
	//Draw Mobile Icon
	drawReset();
	draw_sprite(sMobilePause,0,mobilePos.x,mobilePos.y);
}