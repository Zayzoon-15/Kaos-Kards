///@desc Attack


//Get Action
GetPlayerAction();

//Audio
var _pitch = random_range(.8,1.2);
audio_play_sound(snUseCard,0,false,.5,0,_pitch);

startingX = targetX;