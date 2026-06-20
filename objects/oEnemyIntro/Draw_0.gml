//Draw Background
draw_set_color(c_black);
draw_set_alpha(.7*image_alpha);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);
drawReset(); //Quick Reset

//Draw Bars
draw_set_color(c_black);
var _barHMin = 10 * easeTime;
var _barHMax = 120 * easeTime;

//Draw Top Bar
drawRectPos(
    new Vector2(SCREEN_EDGE.left,_barHMax-4),
    new Vector2(SCREEN_EDGE.left,0),
    new Vector2(SCREEN_EDGE.right,_barHMin+5),
    new Vector2(SCREEN_EDGE.right,0)
);

//Draw Bottom Bar
drawRectPos(
    new Vector2(SCREEN_EDGE.left,SCREEN_HEIGHT),
    new Vector2(SCREEN_EDGE.left,SCREEN_HEIGHT-_barHMin),
    new Vector2(SCREEN_EDGE.right,SCREEN_HEIGHT),
    new Vector2(SCREEN_EDGE.right,SCREEN_HEIGHT-_barHMax)
);


//Draw Enemy
anims.update();
var _enemyShake = new Vector2(
    random_range(-1,1) * enemyShake,
    random_range(-1,1) * enemyShake
);
enemyShake = lerp(enemyShake,0,.2);
draw_sprite_ext(sprite_index,image_index,enemyX + _enemyShake.x,enemyY + _enemyShake.y,enemyXScale,enemyYScale,0,image_blend,image_alpha);

//Draw Enemy Name
textSetup(fnMain,fa_center,fa_middle);
draw_text_ext_transformed(enemyX+250,ROOM_CENTER.y,info.name,-1,40,textScale,textScale,0);


//Draw Flash
draw_set_color(c_white);
draw_set_alpha(1*flashAlpha);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);
drawReset(); //Quick Reset
