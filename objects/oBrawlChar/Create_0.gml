//Set Position
y = oBrawlSetup.y + 30 - sprite_get_height(sBrawlMap)/2;
x = playerId == 0 ? x - 90 : x + 90;

//Reset Position
ystart = y;

//Create Solids
if !instance_exists(oBrawlSolid)
{
	instance_create_depth(xstart,y+1,depth,oBrawlSolid,{
		image_xscale : 300	
	})
}

//Input
keyRight = 0;
keyLeft = 0;

//Movement
moveSpd = 2;
xspd = 0;
knockBack = 0;
canMove = false;

//Jumping
onGround = false;
yspd = 0;
grav = .9;
jumpSpd = 10;
fallspd = 0;

//Punching
punchStun = 0;

//Hit
hitStun = 0;
invisTime = 0;
invisFlash = 0;
hp = 100;

//Set Sprites
if playerId == 0
{
	winSprites = [
		sBrawlRedWin1,
		sBrawlRedWin2,
		sBrawlRedWin3,
	];
	
	sprites = {
		idle : sBrawlRedIdle,	
		hit : sBrawlRedHit,	
		punch : sBrawlRedPunch,	
		walk : sBrawlRedWalk,	
		jump : sBrawlRedJump,
		air : sBrawlRedAir,
		win : winSprites[irandom_range(0,2)]
	};
} else {
	
	winSprites = [
		sBrawlBlueWin1,
		sBrawlBlueWin2,
		sBrawlBlueWin3,
	];
	
	sprites = {
		idle : sBrawlBlueIdle,	
		hit : sBrawlBlueHit,	
		punch : sBrawlBluePunch,
		walk : sBrawlBlueWalk,
		jump : sBrawlBlueJump,
		air : sBrawlBlueAir,
		win : winSprites[irandom_range(0,2)]
	};	
}

//Image
xscale = 1;
yscale = 1;
dir = playerId == 0 ? 1 : -1;

//Winner
won = false;

//Functions
actPunch = function()
{
	//Can't Move
	if !canMove then exit;
	
	//Already Punched
	if punchStun > 0 then exit;
	
	//Stun Time
	punchStun = 10;
	
	//Audio
	audioPlaySfx(snWoosh);
	
	//Box Values
	var _x = x + (30 * dir);
	var _y = onGround ? y - (sprite_height/2) : y + 10 - (sprite_height/2);
	var _life = 10;
	var _w = onGround ? 10 : 15;
	var _h = onGround ? 20 : 20;
	
	//Create Hurt Box
	instance_create_depth(_x,_y,depth,oBrawlHurtBox,{
		playerInst : self.id,
		lifeSpan : _life,
		boxW : _w,
		boxH : _h
	});
}

actHit = function()
{
	//Don't Hit If Invincible
	if invisTime > 0 then exit;
	
	//Stun Time
	hitStun = 20;
	invisTime = 35;
	
	//Push Back
	knockBack += 10 * -dir;
	
	//Audio
	audio_stop_sound(snWoosh);
	audioPlaySfx(snBrawlPunch);
	audioPlaySfx([snBrawlHit1,snBrawlHit2]);
	
	//Health
	randomise();
	var _amount = irandom_range(8,12);
	hp -= _amount;
	
	//Health Bar
	with oBrawlHp
	{
		if playerId == other.playerId
		{
			shake = 5;
		}
	}
}

actJump = function()
{
	//Not On Ground
	if !onGround then exit;
	
	//Not Punching
	if punchStun > 0 then exit;
	
	//Can't Move
	if !canMove then exit;
	
	//Jump
	yspd = -jumpSpd;
}