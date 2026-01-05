//Get Text Size
draw_set_font(targetFont);
height = string_height_ext(text,-1,maxWidth/textScale)*textScale;
width = string_width_ext(text,-1,maxWidth/textScale)*textScale;

//Depth
depth = -5;