//Destroy If Not Real
if global.currentTourney == undefined
{
    instance_destroy();
    exit;
} else if global.currentTourney.timeLimit == -1 then instance_destroy();

//Hover
canHover = true;

//Set Game Timer
global.gameTimer = global.currentTourney.timeLimit;

//Tick Timer Down
alarm[0] = 60;