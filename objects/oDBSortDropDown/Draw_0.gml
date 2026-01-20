//Setup Text
textSetup(fnMain,fa_center,fa_middle);

//Create Surface
var _surface = surface_create(listW,(listH+sprite_height+2));
surface_set_target(_surface);
draw_clear_alpha(c_black, 0); 

//Draw Bg
draw_set_colour(c_dkgrey);
draw_rectangle(0,0,(surface_get_width(_surface)-2),(listH-3)*listScale,false);

//Draw Text
for (var i = 0; i < array_length(items); i++) {
    
    //Set Color
    var _boxColor = i == hover ? c_gray : c_dkgrey;
    var _textColor = i == hover ? c_white : c_gray;
    
    //Position
    var _x = surface_get_width(_surface)/2;
    var _y = -sprite_height+((itemH/2)+((i+1)*itemH))*listScale;
    
    //Draw Box
    draw_set_colour(_boxColor);
    draw_rectangle(2,_y-(itemH/2),surface_get_width(_surface)-2,_y+(itemH/2)-1,false);
    
    //Draw Text
    draw_set_colour(_textColor);
    draw_text(_x,_y,items[i].text);
    
    //Reset Color
    draw_set_colour(c_white);
}

//Draw Outline
draw_sprite_stretched(sDBSortSmallBox,0,surface_get_width(_surface)-listW,-sprite_height,listW,(listH+sprite_height+2)*listScale);

//Draw Surface
surface_reset_target();
draw_surface(_surface,bbox_right-listW,bbox_bottom-2);
surface_free(_surface);


//Draw Main Text
draw_text(x,y,items[selected].text);

//Draw Title
textSetup(fnMain,fa_center,fa_bottom);
draw_text(x,bbox_top-10,$"{title}:");

//Draw Main Box
draw_self();