//Image
currentAnim = 3;
frame = 0;
animationEnd = false;

//Animation
animPos = 1;
animSpd = 0.05;

//Play
randomise();
action = irandom_range(0,2);
winner = false;
outcome = "";
played = false;

//Hand Id
//0: player 
//1: enemy
handId = instance_number(object_index) - 1;