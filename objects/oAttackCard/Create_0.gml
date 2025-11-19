//Set Sprite
sprite_index = card.info.sprite;

//Image
shake = 0;
flashAlpha = 0;
flashColor = c_white;

//Animation
angle = 0;
curvePos = 0;

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

/// @desc Make the card have juice
/// @param {bool} [_stars] [True] If it should have stars
/// @param {bool} [_angle] [True] If it should rotate
/// @param {array<real>} [_angleAmount] [8,14] The amount it rotates [Lowest, Highest]
cardJuice = function(_stars = true,_angle = true,_angleAmount = [8,14])
{
    //Scale
    setSize(1.5,1.5);
    
    //Stars
    if _stars
    {
        starEffect(x,y,8,false,10,15);
    }
    
    //Angle
	if _angle
	{
		angle += random_range(_angleAmount[0],_angleAmount[1])*choose(-1,1);
	}
}

/// @desc Makes the card shake
cardShake = function()
{
    var _tween = TweenCreate(self,EaseLinear,TWEEN_MODE_ONCE,false,0,10,"curvePos",0,1);
    TweenPlay(_tween);
}

/// @desc The card hurt effect
/// @param {any*} _value The damage amount
/// @param {bool} [_stars] [True] If it should have stars
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
        starEffect(x,y,5,false,20,25);
    }
}

/// @desc Makes the card flash
/// @param {any*} [_flashAmount] [1] The amount it should flash
/// @param {any*} [_flashColor] [c_white] The flash color
cardFlash = function(_flashAmount = 1,_flashColor = c_white)
{
    flashAlpha = _flashAmount;
    flashColor = _flashColor;
}