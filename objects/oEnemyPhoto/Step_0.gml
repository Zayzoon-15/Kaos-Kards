//Draw Info
drawTipBox(global.currentEnemy.name, false);

//Set To Right Side
x = getPosToWindow(true);

//Set Sprite
sprite_index = global.currentEnemy.sprite;


//Animate
Enemy.SetupAnims(false);
//
//if currentAnim != undefined
//{
    ////Update Frame
    //frame += sprite_get_speed(sprite_index) / 60;
    //
    ////Animate
    //if frame >= currentAnim.length
    //{
        //if currentAnim.loop
        //{
            //frame -= currentAnim.length;
        //} else {
            //frame = currentAnim.length - 1;
            //
            //if !animationEnd
            //{
                //event_user(0);
            //}
        //}
        //
        //animationEnd = true;
    //}
    //
    //
    ////Apply Frame
    //image_index = currentAnim.start + frame;  
//}
//
////Reduce Ignore Time
//if ignoreTime > 0
//{
    //ignoreTime --;
//} else if resetAnim != ""
//{
    //Enemy.PlayAnim(resetAnim);
    //resetAnim = "";
//}