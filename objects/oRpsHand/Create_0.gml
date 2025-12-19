//Image
currentAnim = 3;
frame = 0;
animationEnd = false;

//Animation
animPos = 1;
animSpd = 0.05;

//Play
winner = false;
outcome = "";
played = false;

//Set Scale
image_xscale = handId == 0 ? 1 : -1;

//Slide In
var _startX = handId == 0 ? -sprite_width : room_width + sprite_get_width(sprite_index);
var _targetX = handId == 0 ? -80 : room_width + 80;
TweenEasyMove(_startX,y,_targetX,y,0,20,EaseOutBack);

//Hand Animate
handDown = 0;
alarm[0] = 30;

//Sound
soundPlayed = false;