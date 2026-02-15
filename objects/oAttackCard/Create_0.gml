///@desc Setup Card

//Set Sprite
sprite_index = card.info.sprite;

//Image
shakeTarget = 0;
shakeEase = .1;
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
value = card.value != undefined ? ceil(card.value*VALUE_MULT) : undefined; //Reduce Value
value = card.value != undefined ? value * global.valueMult : undefined;

//Action
var _actTime = 30;
if card.info.type == CARDTYPES.KAOS then _actTime = 60;
if combo then _actTime = 80;
alarm[0] = _actTime;

#region Functions

/// @desc Make the card have juice
/// @param {bool} [_stars] [True] If it should have stars
/// @param {bool} [_starSound] [False] If it should have the stars sound effect
/// @param {bool} [_angle] [True] If it should rotate
/// @param {array<real>} [_angleAmount] [8,14] The amount it rotates [Lowest, Highest]
cardJuice = function(_stars = true,_starSound = false,_angle = true,_angleAmount = [8,14])
{
    //Scale
    setSize(1.5,1.5);
    
    //Stars
    if _stars
    {
        effectStar(x,y,8,_starSound,10,15);
    }
    
    //Angle
	if _angle
	{
		angle += random_range(_angleAmount[0],_angleAmount[1])*choose(-1,1);
	}
}

/// @desc Makes the card shake from left to right
cardShake = function()
{
    var _tween = TweenCreate(self,EaseLinear,TWEEN_MODE_ONCE,false,0,10,"curvePos",0,1);
    TweenPlay(_tween);
}

/// @desc The card hurt effect
/// @param {real} _value The damage amount
/// @param {bool} [_stars] [True] If it should have stars
cardHurt = function(_value,_stars = true)
{
    //Shake
    shake += 25;
    
    //Scale
    setSize(1.2,1.2);
    
    //Number Effect
    effectNumber(x,y,-_value);
    
    //Stars
    if _stars
    {
        effectStar(x,y,5,false,20,25);
    }
}

/// @desc Makes the card flash
/// @param {real} [_flashAmount] [1] The amount it should flash
/// @param {Constant.Color} [_flashColor] [c_white] The flash color
cardFlash = function(_flashAmount = 1,_flashColor = c_white)
{
    flashAlpha = _flashAmount;
    flashColor = _flashColor;
}

/// @desc Makes the card shake in all directions
/// @param {real} [_shakeAmount] [1] The amount it should shake
/// @param {float} [_easeAmount] [.1] The ease amount
cardSetShake = function(_shakeAmount,_easeAmount = .1)
{
	shakeTarget = _shakeAmount;
	shakeEase = _easeAmount;
}


#endregion