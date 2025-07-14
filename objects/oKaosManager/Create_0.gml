
//Set Current Card
playerCard = 0;
enemyCard = 0;


//Who Goes First
randomize();
playerFirst = choose(true,false);

//Card Positions
yOffset = 150;
xOffset = 400;


//Start Kaos
alarm[0] = 30;


//Functions
getXPos = function(_index)
{
    switch (_index) {
        case 0: return (room_width/2)-xOffset;
        case 1: return (room_width/2);
        case 2: return (room_width/2)+xOffset;
    }
}