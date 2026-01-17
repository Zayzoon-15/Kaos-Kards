//Set Position
y = oBrawlSetup.y + 30 - sprite_get_height(sBrawlMap)/2;
x = playerId == 1 ? x - 90 : x + 90;

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
keyBlock = 0;

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

//Blocking
blocking = false;
blockChance = 5;

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
		block : sBrawlRedBlock,
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
		block : sBrawlBlueBlock,
		win : winSprites[irandom_range(0,2)]
	};	
}

//Image
xscale = 1;
yscale = 1;
dir = playerId == 1 ? 1 : -1;
textAlpha = 1;
TweenFire(self,EaseLinear,0,false,320,40,"textAlpha",1,0);
nameTriFrame = 0;

//Winner
won = false;

//Functions
actPunch = function()
{
	//Not Stunned
	if !canMove or (punchStun > 0 or hitStun > 0)
	{
		exit;
	}

	//Stun Time
	punchStun = 10;
	
	//Audio
	audioPlaySfx(snWoosh,.95,1.1);
	
	//Box Values
	var _x = x + (30 * dir);
	var _y = onGround ? y - (sprite_height/2) : y + 10 - (sprite_height/2);
	var _life = 10;
	var _w = onGround ? 5 : 5;
	var _h = onGround ? 15 : 10;
	
	//Create Hurt Box
	instance_create_depth(_x,_y,depth,oBrawlHurtBox,{
		playerInst : self.id,
		lifeSpan : _life,
		boxW : _w,
		boxH : _h
	});
}

actHit = function(_blockBroke = false)
{
	//Block
	if blocking and !_blockBroke
	{
		//Push Players
		with oBrawlChar
		{
			if !blocking
			{
				knockBack -= 5 * dir;
				punchStun += 10;
			}
		}
		
		//Reduce Block Chance
		blockChance --;
		
		//Broke Block
		if blockChance <= 0
		{
			//Reduce Block Chance More
			blockChance -= 5;
			blocking = false;
			
			//Stun
			actHit(true);
			
			//Exit
			exit;
		}
		
		//Sound
		audioPlaySfx([snBrawlBlock1,snBrawlBlock2,snBrawlBlock3]);
		
		//Exit
		exit;
	}
	
	//Don't Hit If Invincible
	if invisTime > 0 then exit;
	
	//Stun Time
	if !_blockBroke
	{
		hitStun = 20;
		invisTime = 35;
	} else
	{
		hitStun = 50;
	}
	
	//Push Back
	if !_blockBroke then knockBack += 10 * -dir;
	
	//Audio
	audio_stop_sound(snWoosh);
	if !_blockBroke
	{
		audioPlaySfx(snBrawlPunch);
		audioPlaySfx([snBrawlHit1,snBrawlHit2]);
	} else audioPlaySfx(snBrawlBlockBroke);
	
	//Health
	var _amount = !_blockBroke ? irandom_range(8,12) : irandom_range(5,8);
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
	//Check
	if !onGround or !canMove or (punchStun > 0 or hitStun > 0)
	{
		exit;
	}
	
	//Jump
	yspd = -jumpSpd;
}

actBlock = function()
{
	//Check
	if !onGround or !canMove or (punchStun > 0 or hitStun > 0)
	{
		exit;
	}
	
	//Broke Block
	if blockChance <= 0
	{
		//Reduce Block Chance More
		blockChance -= 5;
		blocking = false;
			
		//Stun
		actHit(true);
			
		//Exit
		exit;
	}
	
	//Set Block
	blocking = true;
}