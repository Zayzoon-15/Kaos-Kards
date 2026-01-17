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
alarm[0] = 50;

//Voice Line
var _voicelines = [voiceInfo.kaosBegin,voiceInfo.downForKaos];
timeSourceCreate(10,audioPlayVoice,[_voicelines,false,3],time_source_units_frames);

//Functions
getXPos = function(_index)
{
    switch (_index) {
        case 0: return (room_width/2)-xOffset;
        case 1: return (room_width/2);
        case 2: return (room_width/2)+xOffset;
    }
}