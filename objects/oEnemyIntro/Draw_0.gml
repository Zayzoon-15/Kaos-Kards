//Draw Background
draw_set_color(c_black);
draw_set_alpha(.8*image_alpha*bgAlpha);
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


//Update Enemy
anims.update();
var _enemyShake = new Vector2(
    random_range(-1,1) * enemyShake,
    random_range(-1,1) * enemyShake
);
enemyShake = lerp(enemyShake,0,.2);

//Draw Enemy Shadow
var _shadowScale = .02;
draw_sprite_ext(sprite_index,image_index,enemyX + _enemyShake.x + 15,enemyY + _enemyShake.y+15,enemyXScale-_shadowScale,enemyYScale-_shadowScale,0,c_black,image_alpha*SHADOW_ALPHA);

//Draw Enemy
draw_sprite_ext(sprite_index,image_index,enemyX + _enemyShake.x,enemyY + _enemyShake.y,enemyXScale,enemyYScale,0,image_blend,image_alpha);

//Draw Enemy Name
textSetup(fnMain,fa_center,fa_middle);

//Draw Text Shadow
draw_set_color(c_black);
draw_set_alpha(image_alpha * SHADOW_ALPHA);
draw_text_ext_transformed(enemyX+260,ROOM_CENTER.y+10,info.name,-1,40,textScale,textScale,0);

//Draw Text
draw_set_color(c_white);
draw_set_alpha(1);
draw_text_ext_transformed(enemyX+250,ROOM_CENTER.y,info.name,-1,40,textScale,textScale,0);


//Draw Flash
draw_set_color(c_white);
draw_set_alpha(1*flashAlpha);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);
drawReset(); //Quick Reset
