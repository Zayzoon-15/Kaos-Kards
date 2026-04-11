//Draw Hidden Deck
if cardsLeft <= 0
{
    drawRectOutlined(bbox_left,bbox_top,bbox_right,bbox_bottom,UIBOX_RAD,0,c_black,c_white,.3*image_alpha,0);
}

//Draw Deck
for (var i = 1; i < cardsLeft; i++) {
    //Draw Deck
	draw_sprite_ext(sprite_index,image_index,targetX,targetY-(i*currentCardSep),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
    
    //Draw Dark
    draw_sprite_ext(sprite_index,image_index,targetX,targetY-(i*currentCardSep),image_xscale,image_yscale,image_angle,c_black,image_alpha*.3);
}

if cardsLeft != 0
{
    //Deck Shadow
    draw_sprite_ext(sprite_index,image_index,x+shadowX,y+shadowY,xscale-shadowSize,yscale-shadowSize,angle,c_black,image_alpha*SHADOW_ALPHA);
    
    //Draw Top Deck
    draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,angle,image_blend,image_alpha);
    
}

#region Draw Stats

//Dont Draw If In Enemy Room
if room == rEnemy then exit;

//Setup Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var _text = $"{cardsLeft}/{totalCards}";
height = string_height_ext(_text,-1,maxWidth);
width = string_width_ext(_text,-1,maxWidth);

//Setup Box
var _halfWidth = width/2;
var _rectRound = UIBOX_RAD;
var _x = targetX;
var _y = targetY + (sprite_height/2) + 30;

//Draw The Box
drawRectOutlined(_x-_halfWidth-widthMargin,_y-height-(heightMargin*2),_x+_halfWidth+widthMargin,_y,_rectRound,1,c_black,c_white,UIBOX_ALPHA*image_alpha,1*image_alpha);

//Draw Text
textSetup(fnMain,fa_center,fa_top,c_white,image_alpha);
draw_text_ext_transformed(_x,_y-height-(heightMargin/2),_text,-1,maxWidth,1,1,0);

//Draw Box Hover
if (touchingMouse() or touchingStack) and !grabbed and !global.holdingCard and !global.menuOpen
{
    //Draw Box
    var _w = 20;
    var _h = 20;
    drawRectOutlined(x-_w,y-_h,x+_w,y+_h,UIBOX_RAD,0,c_black,c_white,.6*image_alpha,0);
    
    //Draw Text
    textSetup(fnMain,fa_center,fa_middle,c_white,image_alpha);
    draw_text_transformed(x,y,"View\nDeck",1,1,0);
}

//Reset Draw
drawReset();


#endregion