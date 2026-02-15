//Set Scale
lightScaleX = 1;
lightScaleY = 1;

//Pulse Light
lightSpd = 0.02;
lightAmount = 0.20;
lightTime = 0;

//Create Back Sprite
var _layer = layer_create(depth+2,"INSTERTSPRITE");
var _sprite = layer_sprite_create(_layer,x,y,sprite_index);
layer_sprite_index(_sprite,1);
layer_sprite_xscale(_sprite,image_xscale);

//Draw Text
if room == rDeckBuilder1
{
    var _text = layer_sprite_create(_layer,x,y,sprite_index);
    layer_sprite_index(_text,4);
    layer_sprite_xscale(_text,image_xscale);
}