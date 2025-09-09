
//Flip Sprite
if image_xscale == 1 then flipped = false; else flipped = true;
if flipped then sprite_index = sHealthBarFlipped; else sprite_index = sHealthBar;
image_xscale = 1;

//Health
if target == "Player"
{
    hp = global.playerHp;
	tempHp = global.playerTempHp;
} else {
    hp = global.enemyHp;
	tempHp = global.enemyTempHp;
}


//Image Values
angle = 0;

//TipBox
canHover = true;
tipBoxString = "";

//Icons
icons = [];
iconId = 0;

//List
targetList = playerEffects;

//Hit Stun
startHitStun = false;
lastTemp = tempHp;

//Mask
barMask = undefined;

//Functions
hitEffect = function(_lastTemp)
{
    //Randomize
    randomize();
    
    //Hit Stun
    startHitStun = false;
    alarm[0] = 60;
	
	//TempHp
	lastTemp = _lastTemp;
    
    //Angle
    var _dir = choose(-1,1);
    angle += random_range(5,10)*_dir;
}

gainEffect = function()
{
    //Randomize
    randomize();
    
    //Effects
    var _healX = (sprite_width/2)-30;
    var _healY = (sprite_height/2)-15;
    healthEffect(x,y,10,-_healX,_healX,-_healY,_healY);
}