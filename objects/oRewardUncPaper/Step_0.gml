//Can Grab
canGrab = !global.holdingCard;

//Set Hover
if touchingMouse() and canGrab
{
    //Sound
    if !hover then audioPlaySfx([snPaperHover1,snPaperHover2,snPaperHover3],.95,1.05);
    
    //Set Hover
    hover = true;
    
    //Press
    if mouse_check_button_pressed(mb_left)
    {
        pressed = true;
    }
    
    //Action
    if mouse_check_button_released(mb_left) and pressed
    {
        //Sound
        audioPlaySfx([snPaperHover1,snPaperHover2,snPaperHover3],.95,1.05);
        
        //Leave Unc Dam
        oRewardUnc.alarm[2] = 90;
        oRewardUnc.handImage = 1;
        
        //Hand Juice
        with oRewardUnc
        {
            TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,15,"handXScale",1.1,1);
            TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,15,"handYScale",.9,1);
        }
        
        //Destroy
        instance_destroy();
        
        //Set Pressed
        pressed = false;
    }
    
} else {
    hover = false;
    pressed = false;
}

//Hovered
if hover
{
    targetScale = 1.05;
    image_index = 1;
    //showY = lerp(showY,-8,.3);
} else {
    //showY = lerp(showY,0,.3);
    image_index = 0;
    targetScale = 1;
}

//Increase Sine Times
sineTimes.x += .015;
sineTimes.y += .015;
sineTimes.angle += .02;

//Move Position
//sineX = sineBetween(sineTimes.x,5,-5,5);
sineY = sineBetween(sineTimes.y,5,-5,5);

//Ease
x = lerp(x,targetX,.3);
y = lerp(y,targetY,.3);
image_xscale = lerp(image_xscale,targetScale,.4);
image_yscale = lerp(image_yscale,targetScale,.4);

//Rotate
var _angle = xprevious - x;
image_angle = lerp(image_angle,_angle+sineWave(sineTimes.angle,5,3,0),.2);