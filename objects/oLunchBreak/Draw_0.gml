
//Draw Text
var _x = room_width/2;
var _y = room_height/2;

lunchScale = lerp(lunchScale,2,.1);
breakScale = lerp(breakScale,2,.1);

if showText
{
    draw_sprite_ext(sLunchBreak,0,_x,_y,lunchScale,lunchScale,0,c_white,image_alpha);
    draw_sprite_ext(sLunchBreak,1,_x,_y,breakScale,breakScale,0,c_white,image_alpha);
}