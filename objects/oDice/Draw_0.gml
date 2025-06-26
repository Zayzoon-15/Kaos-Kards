draw_self();

draw_set_font(fnNumber);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(numColor);

if diceNum != undefined
{
    draw_text(x,y,diceNum);
}

draw_set_color(c_white);