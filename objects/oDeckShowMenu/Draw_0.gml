//Draw Rectangle
drawRectOutlined(bbox_left,bbox_top,bbox_right,bbox_bottom,UIBOX_RAD,1,c_black,c_white,.85);

//Draw Information
textSetup(fnMain,fa_left,fa_bottom);
var _pos = new Vector2(bbox_left+10,bbox_bottom-10);
var _info = $"Total Cards Left: {totalCardsLeft}\nAction Cards Left: {actionCardsLeft}\nDice Cards Left: {diceCardsLeft}\nKaos Cards Left: {kaosCardsLeft}\n";
draw_text_transformed(_pos.x,_pos.y,_info,1,1,0);

//Reset
drawReset();