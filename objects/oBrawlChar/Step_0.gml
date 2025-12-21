#region Lost Or Won

if hp <= 0
{
	//Stop Moving
	canMove = false;
	hitStun = 10;
	
	//Finish Kaos
	with oBrawlSetup
	{
		if !gameover
		{
			alarm[4] = 40;
			alarm[2] = 200;
			gameover = true;
			loser = other.playerId
		}
	}
}

if oBrawlSetup.gameover and hp > 0
{
	won = true;
}

#endregion

#region Player Input

if playerId == 0
{
	//Movement
	keyLeft = keyboard_check(ord("A")) or keyboard_check(vk_left);
	keyRight = keyboard_check(ord("D")) or keyboard_check(vk_right);
	
	//Punch
	if keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("L"))
	{
		actPunch();
	}
	
	if keyboard_check_pressed(ord("K")) or keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_space)
	{
		actJump();
	}
	
} else { //Enemy Ai
	if !alarm[0]
	{
		alarm[0] = 30;
	}
}

#endregion


#region Movement

//Set Move Speed
var _spd = onGround ? moveSpd : moveSpd;

//Move Direction
if hitStun <= 0 and (punchStun <= 0 or !onGround)
{
	xspd = (keyRight - keyLeft)*_spd;
} else xspd = 0;

//Reduce Knock Back
knockBack = lerp(knockBack,0,.3);

//Move
if canMove
{
	move_and_collide(xspd+knockBack,0,oBrawlChar);
}

//Fall
yspd += grav;
if place_meeting(x,y+yspd,oBrawlSolid)
{
	while !place_meeting(x,y+sign(yspd),oBrawlSolid)
	{
		y += sign(yspd);
	}
	yspd = 0;
	onGround = true;
} else onGround = false;
y += yspd;

//Clamp
x = clamp(x,oBrawlSetup.bbox_left+40,oBrawlSetup.bbox_right-40);

#endregion


#region Hit

//Clamp Health
hp = clamp(hp,0,100);

//Reduce Stuns
punchStun --;
hitStun --;
invisTime --;
invisFlash --;

//Flash
if invisTime > 0 and invisFlash <= -10
{
	invisFlash = .5;
}

#endregion


#region Animation

if punchStun <= 0 and hitStun <= 0
{
	//Idle And Walk
	if onGround
	{
		if xspd != 0 and canMove
		{
			sprite_index = sprites.walk;
		} else sprite_index = sprites.idle;
	} else sprite_index = sprites.jump;
} else {
	
	//Punch
	if punchStun > 0
	{
		if onGround and sprite_index != sprites.air
		{
			sprite_index = sprites.punch;
		} else sprite_index = sprites.air;
	}
	
	//Hurt
	if hitStun > 0
	{
		sprite_index = sprites.hit;
	}
	
}

//Won The Game
if won and onGround and xspd == 0 and punchStun <= 0
{
	sprite_index = sprites.win;
}

#endregion