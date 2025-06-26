hp = global.playerHp;
shield = global.playerTempHp;

angle = 0;

if flipped
{
    sprite_index = sHealthBarFlipped;
} else sprite_index = sHealthBar;

//Functions
hitEffect = function()
{
    //Randomize
    randomize();
    
    //Audio
    var _sound = asset_get_index($"snHurt{irandom_range(1,2)}");
    audio_play_sound(_sound,0,false);
    
    //Angle
    var _dir = choose(-1,1);
    image_angle += random_range(5,10)*_dir;
}

gainEffect = function()
{
    //Randomize
    randomize();
    
    //Audio
    var _pitch = random_range(.8,1.2);
    audio_play_sound(snHeal,0,false,1,0,_pitch);
    
    //Angle
    var _dir = choose(-1,1);
    image_angle += random_range(5,10)*_dir;
    
    //Effects
    healthEffect(x,y,10,-150,150,-40,80);
}