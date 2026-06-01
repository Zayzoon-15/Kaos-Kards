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
    if mouse_check_button_released(mb_left) and pressed and !shopMenu
    {
        //Fade Out Cards
        with oRewardCard {
            TweenEasyFade(1,0,0,20,EaseOutCubic);
            timeSourceCreate(20,instance_destroy,[self.id],time_source_units_frames);
        }
        
        //Create New Menu
        instance_create_depth(x,y,depth,oRewardShop,{
            shopMenu : true
        });
        global.menuOpen = true;
        
        //Destroy Self
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
    showY = lerp(showY,-8,.3);
    shadowY = lerp(shadowY,15,.2);
    shadowSize = lerp(shadowSize,0.05,.2);
} else {
    showY = lerp(showY,0,.3);
    shadowY = lerp(shadowY,15,.2);
    shadowSize = lerp(shadowSize,0.1,.2);
}


//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-6,6);
shadowX = lerp(shadowX,_shadowX,.2);

//Increase Sine Times
sineTimes.x += .01;
sineTimes.y += .01;
sineTimes.angle += .02;

//Move Position
sineX = sineBetween(sineTimes.x,5,-5,5);
sineY = sineBetween(sineTimes.y,5,-5,5);

//Ease
x = lerp(x,targetX,.3);
y = lerp(y,targetY,.3);
image_xscale = lerp(image_xscale,startScale,.4);
image_yscale = lerp(image_yscale,startScale,.4);

//Rotate
var _angle = xprevious - x;
image_angle = lerp(image_angle,_angle+sineWave(sineTimes.angle,5,3,0),.2);