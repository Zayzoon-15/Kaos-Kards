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
var _actTime = 30;
if card.info.type == CARDTYPES.KAOS
{
	_actTime = 60;
}
alarm[0] = _actTime;

//Functions
cardJuice = function(_stars = true,_angle = true)
{
    //Scale
    setSize(1.5,1.5);
    
    //Stars
    if _stars
    {
        starEffect(x,y,8,10,15);
    }
    
    //Angle
	if _angle
	{
		angle += random_range(8,14)*choose(-1,1);
	}
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
    numberEffect(x,y,-_value);
    
    //Stars
    if _stars
    {
        starEffect(x,y,5,20,25);
    }
}