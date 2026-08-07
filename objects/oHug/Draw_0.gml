

//Draw Loner
if loner.show
{
    draw_sprite_ext(sprite_index,spriteLoopFrames(0,3,sprite_index,false,"lonerFrame","lonerEnd"),loner.x,loner.y,image_xscale,image_yscale,image_angle,image_blend,loner.alpha);
}

//Draw Hugger
if hugger.show
{
    draw_sprite_ext(sprite_index,spriteLoopFrames(1,3,sprite_index,false,"huggerFrame","huggerEnd"),hugger.x,hugger.y,image_xscale,image_yscale,image_angle,image_blend,hugger.alpha);
}

//Draw Final Hug
if !hugger.show and !loner.show
{
    draw_sprite_ext(sprite_index,spriteLoopFrames(2,3,sprite_index,false,"frames","animEnd"),x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}