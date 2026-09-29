//Draw Card
event_inherited();

//Draw Value
valueScale = lerp(valueScale, 1, .2);
if currentValue != undefined {
    textSetup(fonts.numberOutline, fa_center, fa_middle);
    draw_text_transformed(x, bbox_top - 40, currentValue, valueScale, valueScale, image_angle);
}