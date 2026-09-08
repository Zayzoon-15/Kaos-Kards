//Set Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+cardOffsetX+shadowX+_shakeX, y+cardOffsetY+shadowY+_shakeY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);

//Draw Card
//draw_sprite_ext(sprite_index, image_index, x+cardOffsetX+_shakeX, y+cardOffsetY+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

drawCard3d(x + cardOffsetX, y + cardOffsetY, sprite_index, global.currentDeck.sprite, card3dRot, image_angle);