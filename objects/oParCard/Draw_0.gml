//Set Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.3);

//Get XScale Based On 3d Flip
var _xScale = global.cardFlip ? cos(degtorad(card3dRot)) : 1;

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+cardOffsetX+shadowX+_shakeX, y+cardOffsetY+shadowY+_shakeY, (image_xscale*_xScale)-shadowSize, image_yscale-shadowSize, image_angle, c_black, SHADOW_ALPHA*image_alpha);

//Draw Card
drawCard3d(x + cardOffsetX + _shakeX, y + cardOffsetY + _shakeY, sprite_index, global.currentDeck.sprite, card3dRot, image_angle);

/*
//DEBUG STUFF
var _state = "Placed";
if state == CARD_STATES.HAND then _state = "Hand"; else if state == CARD_STATES.GRABBED then _state = "Grabbed";
draw_text(x,bbox_bottom + 10,$"CardId: {cardId}\nState: {_state}")