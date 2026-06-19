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
Enemy.SetupAnims(false);
var _enemyX = (ROOM_CENTER.x + 50)
draw_sprite_ext(sprite_index,image_index,_enemyX,ROOM_CENTER.y,1,1,0,image_blend,image_alpha);

//Draw Enemy Name