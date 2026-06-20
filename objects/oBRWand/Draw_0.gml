//Get Animation Value
y = ystart + animGetValue(acBRWand,curvePos,"y") * -12;
image_angle = animGetValue(acBRWand,curvePos,"angle") * 5 * angleDir;
curvePos += curveSpd;

//Draw Shadow
if sprite_index == sBRWand
{
    var _scaleX = angleDir == -1 ? skewScaleX - (ystart - y)*.005 : skewScaleX + (ystart - y)*.005;
    var _scaleY = angleDir == -1 ? skewScaleY - (ystart - y)*.005 : skewScaleY + (ystart - y)*.005;
    draw_sprite_pos_ext(sprite_index,1,x + xOffset,ystart + yOffset,sprite_width,sprite_height,sprite_xoffset,sprite_height,_scaleX,_scaleY,skewX,skewY,skewAngle,SHADOW_ALPHA_BREAK_ROOM);
} else {
    var _scale = .35 - (ystart - y)*.006;
	draw_sprite_ext(sShadow,0,x,ystart-5,_scale,_scale,0,image_blend,image_alpha * SHADOW_ALPHA_BREAK_ROOM);
}

//Draw Wand
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);