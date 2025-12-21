///@desc Win Effects

//Audio
audioPlaySfx(snBrawlWin);

//Confent fentfent
repeat 3
{
	for (var i = 0; i < 50; ++i) {
	    var _x = bbox_left + 10 + 8*i;
	
		instance_create_depth(_x,bbox_top,depth,oBrawlWinEffect);
	}
}