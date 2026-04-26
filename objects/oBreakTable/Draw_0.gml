//Draw Shadow
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Draw Bottom Items
for (var i = 0; i < array_length(items); i++) {
	if !items[i].onTop
    {
        draw_sprite_ext(items[i].sprite,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
    }
}

//Draw Table
draw_self();

//Draw Top Items
for (var i = 0; i < array_length(items); i++) {
	if items[i].onTop
    {
        draw_sprite_ext(items[i].sprite,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
    }
}


//Draw Bean Bag
draw_sprite_ext(sBreakBeanBag,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);