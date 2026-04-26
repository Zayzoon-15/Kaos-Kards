///@desc Create Button

//Button
instance_create_layer(room_width/2,room_height/2,"Buttons",oKaosOverButton);

//Voice Line
var _voiceline = voiceNeutral;
if irandom_range(1,3) == 1
{
    if global.playerPerformance > global.enemyPerformance
    {
        _voiceline = voiceWinning;
    } else _voiceline = voiceLosing;
}

audioPlayVoice(_voiceline,false,3);