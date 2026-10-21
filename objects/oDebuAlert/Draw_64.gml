//Increase Size Of Width If Text Is Too Long
if string_width(alertText) + 15 > width {
    width = string_width(alertText) + 15;
}

//Set Alert Position
//Draw it from its position outward
//So the actual position of the object is on the left side of the screen
//But like this we can move the alert box easily
var _x1 = x + margin.x, _y1 = y - margin.y;
var _x2 = _x1 + width, _y2 = _y1 - height;

//Draw Alert Box
drawRectOutlined(_x1, _y1, _x2, _y2, 5, 1, c_black, c_white, .6 * image_alpha, image_alpha);

//Draw Alert Text
textSetup(fnDebug, fa_left, fa_middle, c_white, image_alpha);
var _title = extraNum > 0 ? $"{alertTitle} {extraNum}x" : alertTitle;
print(_title);
if _title != "" { //Draw Alert With A Title
    
    //Draw Text
    draw_set_valign(fa_bottom);
    draw_text_transformed(_x1 + margin.x, _y1 - 5, alertText, 1, 1, 0);
    
    //Draw Title
    draw_set_valign(fa_top);
    draw_text_transformed(_x1 + margin.x, _y2 + 5, _title, 1, 1, 0);
    
    //Draw Seperating Line
    draw_line(_x1 + 5, _y2 + 23, _x2 - 5, _y2 + 23);
    
} else draw_text_transformed(_x1 + margin.x, (_y1 - height/2), alertText, 1, 1, 0); //Draw Normal Alert

//Reset Drawing
drawReset();