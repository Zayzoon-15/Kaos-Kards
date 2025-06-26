
//Draw Bg
drawBox(x,y,480,300,40,.4);

//Set Alpha
draw_set_alpha(image_alpha);

//Sprite
var _x = room_width/2;
var _y = (room_height/2)+40;
tutAnim += .2;

draw_sprite_ext(tutSprite,tutAnim,_x,_y,1.5,1.5,0,c_white,image_alpha);


//Draw Text
draw_set_font(fnMain);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext_transformed(room_width/2,30,title,15,470,3,3,0);
draw_text_ext_transformed(room_width/2,80,infoText,15,470,1.5,1.5,0);

//Reset
draw_set_alpha(1);