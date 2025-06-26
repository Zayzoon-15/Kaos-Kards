
setSize(2,2);

if lunch
{
    image_index = 0;
    delay = 10;
    ypos = 675;
} else {
    image_index = 1;
    delay = 0;
    ypos = 619.4;
} 


TweenEasyScale(2,2,0.5,1.2,delay,34,EaseInBack);
TweenEasyMove(x,y,oLunchBag.x,ypos,delay,35,EaseInBack);

alarm[0] = 38+delay;