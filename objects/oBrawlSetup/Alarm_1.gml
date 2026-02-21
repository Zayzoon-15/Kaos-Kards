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
	audioPlaySong(choose("Retro1","Retro2"),300,"Pause");
	
	with oBrawlChar {canMove = true;}
    
    //Voice Over
    var _voicelines = [voiceInfo.brawlFreak,voiceInfo.brawlRetro,voiceInfo.brawlTimes];
    timeSourceCreate(random_range(70,90),audioPlayVoice,[_voicelines,false,2],time_source_units_frames);
}