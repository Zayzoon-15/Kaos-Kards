//Inherit the parent event
event_inherited();

//Set Info To See It I Code
info ??= CardsAction.Bread;

//Toggles
grabbable = false;

//Ease
scaleEaseMethod = easeMethods.spring;
positionEaseMethod = easeMethods.spring;

//Move Card Down
y = targetEnemy ? room_height + sprite_height : -sprite_height;

//Fire Action
if autoFire {
    d_alarm[0] = 40;
}

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
		image_angle += random_range(_angleAmount[0],_angleAmount[1])*choose(-1,1);
	}
}