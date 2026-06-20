//Enemy Animation
oEnemyPhoto.anim.play("kaosHotDogStart");

//Change Song
audioPlaySong(global.currentEnemy.customSong.minigame);

//Create Food
var _foodY = 435;
var _foodX = [246,400,880,1034];
instance_create_depth(_foodX[0],_foodY,depth-1,oHotdogFood);
instance_create_depth(_foodX[1],_foodY,depth-1,oHotdogFood);
instance_create_depth(_foodX[2],_foodY,depth-1,oHotdogFood);
instance_create_depth(_foodX[3],_foodY,depth-1,oHotdogFood);