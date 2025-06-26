
//Draw Sprite
draw_self();

//Draw Warning
var _card = instance_place(x,y,oCard);

//Warn Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

if _card and used and _card.cardInfo.type != "Action" and _card.canBePlaced
{
    draw_text(_card.x,_card.bbox_top,"Slot has already been used!");
}
