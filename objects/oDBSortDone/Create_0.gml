//Set Image
image_speed = 0;
image_index = image_number - 1;

//Pressed
pressed = false;
doAction = false;

//Text
textYOffset = 0;
textScaleOffset = 0;

//Distance
distX = x - oDBSort.x;
distY = y - oDBSort.bbox_bottom;

//Fade
TweenEasyFade(0,1,0,8,EaseInCubic);