///@desc Speak

//Restart Talk Timer
if instance_exists(oBRBubble)
{
    alarm[0] = irandom_range(2,10) * 60;
    exit;
}

//Create Text Bubble
instance_create_depth(x,y,depth,oBRBubble,{
    text : array_get_random(text)
});

//Start Again Way Later
alarm[0] = irandom_range(10,60) * 60;