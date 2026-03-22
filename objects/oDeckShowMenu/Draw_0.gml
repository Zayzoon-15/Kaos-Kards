draw_set_alpha(image_alpha);

//Draw Shadow
draw_sprite_ext(sprite_index,image_index,x,y+15,image_xscale-.1,image_yscale-.1,image_angle,c_black,image_alpha*SHADOW_ALPHA);

//Draw Self
image_blend = c_white;
draw_self();


//Draw Card Box
var _margin = new Vector2(40,10);
drawRectOutlined((boxPos.x-boxWidth/2)-_margin.x,(boxPos.y-boxHeight/2)-_margin.y,(boxPos.x+boxWidth/2)+_margin.x,(boxPos.y+boxHeight/2)+_margin.y,UIBOX_RAD,0,c_black,c_white,UIBOX_ALPHA*image_alpha,0);


//Get Correct Info
var _info = "";
if showPlaced
{
   _info = $"Total Cards Left: {totalCardsLeft}\nAction Cards Left: {actionCardsLeft}\nDice Cards Left: {diceCardsLeft}\nKaos Cards Left: {kaosCardsLeft}\n";
} else {
	_info = $"Total Cards: {array_length(playerDeck)}\nAction Cards: {totalActionCards}\nDice Cards: {totalDiceCards}\nKaos Cards: {totalKaosCards}\n";
}

//Setup Info
var _textScale = 2;
var _infoW = 300;
var _infoH = string_height_ext(_info,-1,_infoW)*_textScale;
var _infoPos = new Vector2(bbox_left + 45 + (_infoW/2),bbox_top+15);
var _infoMargin = new Vector2(10,10);

//Draw Info Box
drawRectOutlined((_infoPos.x-_infoW/2)-_infoMargin.x,_infoPos.y-_infoMargin.y,(_infoPos.x+_infoW/2)+_infoMargin.x,(_infoPos.y+_infoH)+_infoMargin.y,UIBOX_RAD,0,c_black,c_white,UIBOX_ALPHA*image_alpha,0);

//Draw Info
textSetup(fnMain,fa_center,fa_top,c_white,image_alpha);
draw_text_ext_transformed(_infoPos.x,_infoPos.y,_info,-1,_infoW,_textScale,_textScale,0);

//Reset
drawReset();