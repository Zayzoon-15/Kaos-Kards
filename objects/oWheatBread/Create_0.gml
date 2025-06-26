angleSpd = 0;

randomize();
damage = irandom_range(2,3)*global.multiplier;

if target == "Enemy"
{
    //Set Sprite
    sprite_index = sBreadThrow;
    
    //Look At Enemy
    if instance_exists(oEnemyPhoto)
    {
        direction = point_direction(x,y,oEnemyPhoto.x,oEnemyPhoto.y);
        image_angle = direction;
    } else instance_destroy();
    
    //Set Size
    setSize(3,3);
    
    speed = 45;
    
} else {
    //Set Sprite
    sprite_index = sBread;
    
    //Set Size
    setSize(.5,.5);
    
    //Angle
    angleSpd = 2;
    
    var _alarmTime;
    
    //Tween
    if !global.breadFirst
    {
        _alarmTime = 25;
        
        angleSpd = 2;
        
        TweenEasyScale(.5,.5,25,25,0,50,EaseInOutExpo);
        TweenEasyMove(x,y,x,room_height/2,0,40,EaseOutExpo);
    } else {
        _alarmTime = 70;
        
        angleSpd = .5;
        
        TweenEasyScale(.2,.2,25,25,0,140,EaseInOutExpo);
        TweenEasyMove(x,y,x,room_height/2,0,80,EaseOutCirc);
    }
    
    //Destroy
    alarm[0] = _alarmTime;
}