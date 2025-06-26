//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+shadowX, y+shadowY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, .7*image_alpha);

//Draw Self
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//Draw Info
if touchingMouse() and canPress
{
    var _infoY = bbox_top - 50;
    
    drawBox(x,_infoY,cardInfo.boxsize.width,cardInfo.boxsize.height,13,.7);
    
    //Text Setup
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_font(fnMain);
    
    //Draw Info
    var _desc;
    
    if cardInfo.range != undefined
    {
        _desc = $"{cardInfo.desc}\nRange: {cardInfo.range.min}-{cardInfo.range.max}";
    } else _desc = $"{cardInfo.desc}";
    
    draw_text_transformed(x,_infoY-58-cardInfo.textYOffset,cardInfo.name,2,2,0);
    draw_text_transformed(x,_infoY-20-cardInfo.textYOffset,_desc,1,1,0);
}