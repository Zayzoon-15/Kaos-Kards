///@desc Go Away

//Fade
depth -= 10;
fade = true;

//Tween
TweenEasyScale(1,1,0,0,50/60,35/60,EaseInBack);
alarm[3] = 90;

//Audio
timeSourceCreate(65,function()
{	
	//Play Song
	audioPlayGroupSong(global.musicGroups.bg,lastSong,120);
	
	//Play Sound
	audioPlaySfx(snCloseWindow);
},[],time_source_units_frames);

//Fade Buttons
if instance_exists(oBrawlMobile)
{
	oBrawlMobile.fade = true;
}