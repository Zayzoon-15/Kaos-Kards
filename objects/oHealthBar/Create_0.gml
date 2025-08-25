

//Flip Sprite
if image_xscale == 1 then flipped = false; else flipped = true;
if flipped then sprite_index = sHealthBarFlipped; else sprite_index = sHealthBar;
image_xscale = 1;

//Health
if target == "Player"
{
    hp = global.playerHp;
    tempHP = global.playerTempHp;
} else {
    hp = global.enemyHp;
    tempHP = global.enemyTempHp;
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

//Functions
hitEffect = function()
{
    //Randomize
    randomize();
    
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