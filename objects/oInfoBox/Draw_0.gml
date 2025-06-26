
//Draw Box
drawBox(x,y,image_xscale,image_yscale,13);

//Text Setup
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnMain);

//Draw Info
var _desc;

if drawRange
{
    _desc = $"{cardDesc}\nRange: {cardRange.min}-{cardRange.max}";
} else _desc = $"{cardDesc}";

draw_text_transformed(x,y-58-textY,cardName,2,2,0);
draw_text_transformed(x,y-20-textY,_desc,1,1,0);
