//Set Sprite
sprite_index = card.info.sprite;

//Animation
shake = 0;
angle = 0;
curvePos = 0;
curveSpd = 0.02;

//Shadow
shadowX = 0;
shadowY = 8;
shadowSize = 0.05;

//Value
if card.value != undefined then value = round(card.value*1.5);

//Action
alarm[0] = 30;

//Functions
cardJuice = function(_stars = true)
{
    //Scale
    setSize(1.5,1.5);
    
    //Stars
    if _stars
    {
        var _starX = (sprite_width/2)-10;
        var _starY = (sprite_height/2)-15;
        starEffect(x,y,8,-_starX,_starX,-_starY,_starY);
    }
    
    //Angle
    angle += random_range(8,14)*choose(-1,1);
}

cardShake = function()
{
    var _tween = TweenCreate(self,EaseLinear,TWEEN_MODE_ONCE,false,0,10,"curvePos",0,1);
    TweenPlay(_tween);
}

cardHurt = function(_value,_stars = true)
{
    //Shake
    shake += 25;
    
    //Scale
    setSize(1.2,1.2);
    
    //Number Effect
    numberEffect(x,y,-value);
    
    //Stars
    if _stars
    {
        var _starX = (sprite_width/2)-20;
        var _starY = (sprite_height/2)-25;
        starEffect(x,y,5,-_starX,_starX,-_starY,_starY);
    }
}