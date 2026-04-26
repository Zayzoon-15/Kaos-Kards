//Set Current Card
playerCard = 0;
enemyCard = 0;

//Combo
playerComboDone = false;

//Who Goes First
playerFirst = choose(true,false);

//Card Positions
yOffset = 150;
xOffset = 400;

//Time
timeBetweenCards = 70;

//Start Kaos
kaosOver = false;
alarm[0] = 50;

//Functions
getXPos = function(_index)
{
    switch (_index) {
        case 0: return (room_width/2)-xOffset;
        case 1: return (room_width/2);
        case 2: return (room_width/2)+xOffset;
    }
}



#region Voice Lines

voiceStarting = [
    voiceInfo.kaosBegin,
    voiceInfo.downForKaos
];

voiceWinning = [
    voiceInfo.dank,
    voiceInfo.bringinKaos,
    voiceInfo.hurtPretty,
    voiceInfo.hurtMark,
    voiceInfo.touchDial
];

voiceLosing = [
    voiceInfo.mild,
    voiceInfo.tryHarder,
    voiceInfo.hurtCheck,
    voiceInfo.hurtOh
];

voiceNeutral = [
    voiceInfo.dank
];


//Play Starting Voice
timeSourceCreate(10,audioPlayVoice,[voiceStarting,false,3],time_source_units_frames);

#endregion