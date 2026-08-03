//Draw Clocks Base
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

#region --- Draw Hands ---

//Hour Hand
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,hourHandAng,image_blend,image_alpha);

//Minute Hand
draw_sprite_ext(sprite_index,2,x,y,image_xscale,image_yscale,minHandAng,image_blend,image_alpha);

#endregion
