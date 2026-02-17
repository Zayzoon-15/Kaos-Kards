//Set Scissor Cut
var _scissor = gpu_get_scissor();
gpu_set_scissor(oBrawlSetup.scissorStruct);

//Draw Character
draw_sprite_ext(sprite_index,image_index,x,y,xscale*dir,yscale,image_angle,image_blend,image_alpha);


//Draw Invisible Brightness
if sprite_index != sprites.hit
{
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,image_index,x,y,xscale*dir,yscale,image_angle,image_blend,image_alpha*invisFlash);
	gpu_set_blendmode(bm_normal);
}

//Draw Block
if blocking
{

	//Setup Block
	if playerId == 0 
	{
		draw_set_colour(#954051);
	} else draw_set_colour(#51498D);
	draw_set_alpha(.7);
	var _blockX = x + 3*dir;
	var _blockY = y - sprite_get_height(sBrawlRed)/2;
	var _blockRad = (blockChance/5)*25;

	//Draw Block
	draw_circle(_blockX,_blockY,_blockRad,false);

	//Draw Block Outline
	draw_set_colour(c_white);
	draw_set_alpha(.8);
	draw_circle(_blockX,_blockY,_blockRad,true);
	draw_circle(_blockX,_blockY,_blockRad+1,true);

	//Reset
	drawReset();

}

//Setup Name
textSetup(fnMain,fa_center,fa_bottom,c_white,textAlpha);
var _x = x + 5*dir;
var _y = bbox_top - 10;
var _text = playerId == 0 ? "PLAYER" : "ENEMY";
nameTriFrame += sprite_get_speed(sBrawlTri)/60;

//Draw Name
draw_text(_x,_y-4,_text);

//Draw Triangle For Name
draw_sprite(sBrawlTri,nameTriFrame,_x+.5,_y+4);

//Reset Draw
gpu_set_scissor(_scissor);
drawReset();