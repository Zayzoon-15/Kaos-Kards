//Flip Sprite
if image_xscale == 1 then flipped = false; else flipped = true;
if flipped then sprite_index = sHealthBarFlipped; else sprite_index = sHealthBar;
image_xscale = 1;

//Health
hp = target == "Player" ? global.playerHp : global.enemyHp;
tempHp = target == "Player" ? global.playerTempHp : global.enemyTempHp;
maxHp = target == "Player" ? global.playerMaxHp : global.enemyMaxHp;

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
    //Sound
    audioPlaySfx([snHurt1,snHurt2],.9,1.1);
    
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
    effectHealth(x,y,10,false,30,15);
}