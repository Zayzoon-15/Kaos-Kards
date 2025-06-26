
draw_set_font(fnMain);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

var _offset = 10;
var _x = display_get_gui_width()-_offset;
var _y = display_get_gui_height()-_offset;

if !global.midTrans
{
    draw_text_transformed(_x,_y,text,2,2,0);
}