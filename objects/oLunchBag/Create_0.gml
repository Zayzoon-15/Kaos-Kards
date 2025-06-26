
//Set Size
setSize(2,2);

//Stop Animation
image_speed = 0;

//Tween
TweenEasyMove(x,y,639,y,0,60,EaseOutCubic);
alarm[0] = 40;


bagFilled = function()
{
    image_index += 1;
    image_speed = 1;
    
    alarm[1] = 35;
}