//Timer
timerMax =  60*10;
timer = timerMax;

//Start Game
gameStarted = false;
alarm[0] = 25;

//Enemy Animation
Enemy.PlayAnim("kaosHotDogStart");

//Change Song
audioPlaySong(global.currentEnemy.customSong.minigame);