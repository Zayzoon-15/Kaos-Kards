//Draw Bg
draw_sprite_stretched(sprite_index,0,x,y,SCREEN_WIDTH,SCREEN_HEIGHT);

//Draw Tourney Art
if global.currentTourney != undefined
{
    //Draw Shadow
    draw_sprite_ext(sTourneyArtBorder,1,artPos.x+15,artPos.y+15,artScale.x-.03,artScale.y-.03,0,c_black,SHADOW_ALPHA);
    
    //Draw Art
    draw_sprite_ext(global.currentTourney.sprite,0,artPos.x,artPos.y,artScale.x,artScale.y,0,c_white,1);
    
    //Draw Border
    draw_sprite_ext(sTourneyArtBorder,0,artPos.x,artPos.y,artScale.x,artScale.y,0,c_white,1);
}