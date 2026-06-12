//Draw Bubble
draw_sprite_ext(sprite_index,image_index,x+8,y+13,image_xscale-0.05,image_yscale-0.05,image_angle,c_black,SHADOW_ALPHA_BREAK_ROOM*image_alpha);
draw_self();

//Set Text Offset
switch image_index {
	case 0: textOffset = new Vector2(0,0) break;
	case 1: textOffset = new Vector2(2,2) break;
	case 2: textOffset = new Vector2(5,-1) break;
	case 3: textOffset = new Vector2(-1.5,0) break;
}

//Draw Text
textSetup(fonts.BRSpeaker,fa_left,fa_top,c_white,image_alpha);
draw_text_ext_transformed(bbox_left + textOffset.x,bbox_top + textOffset.y,textShow,20,maxWidth/textScale,textScale,textScale,image_angle);

//Reset
drawReset();