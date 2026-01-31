//Setup Text
textSetup(fnMain,fa_center,fa_middle);

//Create Surface
var _surface = surface_create(listW,(listH+sprite_height+5));

//Set Surface Target
surface_set_target(_surface);
draw_clear_alpha(c_black, 0); 

//Draw Outline
draw_sprite_stretched(sDBSortDrop,1,surface_get_width(_surface)-listW,-sprite_height,listW,(listH+sprite_height+2)*listScale);

////Draw Bg
//draw_set_colour(#2A2A33);
//draw_rectangle(0,0,(surface_get_width(_surface)-2),(listH-3)*listScale,false);

//Draw Text
for (var i = 0; i < array_length(items); i++) {
    
    //Set Color
    var _boxColor = i == hover ? #403F4C : #2A2A33;
    var _textColor = i == hover ? c_white : c_gray;
    
    //Position
    var _x = surface_get_width(_surface)/2;
    var _y = -sprite_height+((itemH/2)+((i+1)*itemH))*listScale;
    
    //Draw Box
    draw_set_colour(_boxColor);
    draw_rectangle(2,_y-(itemH/2),surface_get_width(_surface)-2,_y+(itemH/2),false);
    
    //draw_set_colour(#323142)
    //draw_rectangle(2,(_y+(itemH/2)-1)-5,surface_get_width(_surface)-2,_y+(itemH/2)-1,false);
    
    //Draw Text Shadow
    draw_set_colour(#323142);
    draw_text(_x+1,_y+2,items[i].text);
    
    //Draw Text
    draw_set_colour(_textColor);
    draw_text(_x,_y,items[i].text);
    
    //Reset Color
    draw_set_colour(c_white);
}

//Draw Outline
draw_sprite_stretched(sDBSortDrop,0,surface_get_width(_surface)-listW,-sprite_height,listW,(listH+sprite_height+2)*listScale);

//Draw Surface
surface_reset_target();
draw_surface(_surface,bbox_right-listW,bbox_bottom-5);
surface_free(_surface);


//Draw Main Box
draw_self();

//Setup Main Text
var _textScale = 1 - textScaleOffset;

//Draw Shadow
draw_set_colour(#323142);
draw_text_transformed(x+1,y+ 2 + textYOffset,items[selected].text,_textScale,_textScale,0);

//Draw Main Text
draw_set_colour(c_white);
draw_text_transformed(x,y + textYOffset,items[selected].text,_textScale,_textScale,0);

//Draw Title
textSetup(fnMain,fa_center,fa_bottom);
draw_text(x,bbox_top-10,$"{title}:");