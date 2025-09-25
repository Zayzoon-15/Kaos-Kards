function setWindowToRes()
{
	var _res = global.resolutions[global.currentRes];
	window_set_size(_res.x,_res.y);
	window_center();
}
