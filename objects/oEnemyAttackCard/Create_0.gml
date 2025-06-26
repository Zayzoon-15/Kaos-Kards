//Position
targetX = x;
targetY = y;
startingX = x;

shadowX = 0;
shadowY = 0;
shadowSize = 0;

//Animation
curvePos = 0;
curveSpd = .15;
animateCard = false;
shakeX = 0;
shakeY = 0;
finalShake = {
    x : 0,
    y : 0,
    xDir : 0,
    yDir : 0
};
sprite_index = struct.cardInfo.sprite;

//Attack
alarm[0] = 20;


//Function
cardJuice = function(_stars = false)
{
    //Juice
    setSize(image_xscale+1,image_yscale+1);
    image_angle += choose(random_range(-15,-5),random_range(5,15));
    
    //Stars
    if _stars
    {
        starEffect(x,y,5);
    }
}