//Draw Bottom
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Draw Light
draw_sprite_ext(sprite_index,2,x,y,image_xscale*lightScaleX,image_yscale*lightScaleY,0,c_white,1);

//Draw Top
draw_sprite_ext(sprite_index,3,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Draw Text
if room == rDeckBuilder1
{
    draw_sprite_ext(sprite_index,4,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}