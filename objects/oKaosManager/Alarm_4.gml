///@desc Create Button

//Button
instance_create_layer(room_width/2,room_height/2,"Ui",oKaosOverButton);

//Voice Line
var _voiceLine = global.playerPerformance > global.enemyPerformance ? [voiceInfo.dank,voiceInfo.bringinKaos] : [voiceInfo.mild,voiceInfo.tryHarder];
audioPlayVoice(_voiceLine,false,3);