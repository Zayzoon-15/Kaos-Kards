///@desc Create Button

//Button
instance_create_layer(room_width/2,room_height/2,"Ui",oKaosOverButton);

//Voice Line
var _voiceline = [];
if global.playerPerformance > global.enemyPerformance {
    _voiceline = [voiceInfo.dank,voiceInfo.bringinKaos,voiceInfo.hurtPretty,voiceInfo.hurtMark]; 
}else {
    _voiceline = [voiceInfo.mild,voiceInfo.tryHarder,voiceInfo.hurtCheck,voiceInfo.hurtOugh]; 
}
audioPlayVoice(_voiceline,false,3);