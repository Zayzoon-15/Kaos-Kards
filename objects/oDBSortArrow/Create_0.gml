//Set Size
setSize(.3,1);

//Arrow
arrowAngle = oDBContainer.ascendOrder ? 0 : 180;
arrowYOffset = 0;
arrowScaleOffset = 0;

//Set Image
image_speed = 0;
image_index = image_number - 1;

//Pressed
pressed = false;
doAction = false;

//Distance
distX = x - oDBSort.x;
distY = y - oDBSort.bbox_bottom;

//Fade
TweenEasyFade(0,1,0,8,EaseInCubic);