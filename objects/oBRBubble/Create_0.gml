//Show Animation
TweenEasyRotate(20,0,0,25,EaseOutBack);
TweenEasyFade(0,1,0,30,EaseOutCubic);

//Text
text = string_upper(text);
textShow = "";
textChars = 0;
textScale = 1;

//Text Area
maxWidth = bbox_right - bbox_left;
maxHieght = 28;

//Finish Talking
finishFrames = 0;
goAway = false;