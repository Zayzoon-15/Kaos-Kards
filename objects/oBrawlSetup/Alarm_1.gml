///@desc Count

//Clear Fx
layer_clear_fx(brawlLayerTop);
layer_clear_fx(brawlLayerBottom);
fxLayer = undefined;

//Create Count
instance_create_depth(x,y,depth-10,oBrawlCount,{
	count : count
});

//Add To Count
count ++;

//Set Alarm
if count < 4
{
	alarm[1] = 70;
} else {
	//Start Song
	audioPlaySong(choose(sgRetro1,sgRetro2),false,300);
	
	with oBrawlChar
	{
		canMove = true;
	}
}