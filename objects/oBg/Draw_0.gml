//Draw Bg
draw_sprite_stretched(sprite_index,0,x,y,SCREEN_WIDTH,SCREEN_HEIGHT);

//Draw Extra Sprite
if extraSprite != noone
{
    var _extraX = extraSpritePos == "Keep Centered" ? 0 : x;
    var _extraY = extraSpritePos == "Keep Centered" ? 0 : y;
    var _extraW = exrtaSpriteStretch ? SCREEN_WIDTH : sprite_get_width(extraSprite);
    var _extraH = exrtaSpriteStretch ? SCREEN_HEIGHT : sprite_get_height(extraSprite);
    
    draw_sprite_stretched(extraSprite,0,_extraX,_extraY,_extraW,_extraH);
}

//Draw Front
if drawFront
{
    draw_sprite(frontSprite,0,0,0);
}

//Draw Flash
draw_set_colour(flashColor);
draw_set_alpha(flashAlpha);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);

//Reset
drawReset();