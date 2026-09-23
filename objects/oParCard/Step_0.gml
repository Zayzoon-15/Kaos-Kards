

#region --- Mouse ---

//Follow Mouse If Grabbed
if grabbed {
	
	targetX = mouse_x - grabOffsetX;
	targetY = mouse_y - grabOffsetY;
	
	//Let Go Of Card
	if !mouse_check_button(mb_left) {
		
		//Set Grabbed
		grabbed = false;
		global.holdingCard = false;
		lastHeldFrames = 10;
	
		//Set State
		state = CARD_STATES.PLACED;
		
		//Reset Rotation
		TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,true,0,.5,"card3dRot",card3dRot,0);
		
		//Function
		onLetgo();
	}
}

//Set Hover
if touchingMouse() and !checkTouchingCards() and !global.holdingCard and hoverable and lastHeldFrames <= 5 {
	
	//Set Hover
	if !hover {
		onHover();
		audioPlaySfx(snCardHover);
		hover = true;
	}
	
	//Darw Info
	drawCardText(info);
	
} else hover = false;

//Reduce Frames
if lastHeldFrames > 0 then lastHeldFrames -= delta();

#endregion

#region --- Position ---

//Set Target Position If Following Placed Position
if followPlaced and !grabbed {
	targetX = placedX;
	targetY = placedY;
}

//Ease To Target Position
xspd = spring(x, xspd, targetX, .5, .3);
yspd = spring(y, yspd, targetY, .5, .3);
x += xspd;
y += yspd;


#endregion

#region --- Image ---

//Hover Effect
if !grabbed {
	
	//Hover
	if hover and !checkTouchingCards() {
		
		//Set Card Offset
		cardOffsetY = lerp_dt(cardOffsetY, -10, .2);
		
		//Set Shadow Properties
		shadowOffsetY = 6;
		shadowTargetSize = 0.06;
		
		//Increase Mouse Time
		mouseTime += delta();
	
	} else {
		
		//Set Card Offset
		cardOffsetY = lerp_dt(cardOffsetY, 0, .2);
		
		//Set Shadow Properties
		shadowOffsetY = 0;
		shadowTargetSize = 0.05;
		
		//3D Flip
		if mouseTime <= 2 and mouseTime > 0 and lastHeldFrames <= 0 {
			
			//Sound
			audio_stop_sound(snCardHover);
			audioPlaySfx(snCardFlip,.95,1.05);
			
			//Tween Flip
			var _dir = sign(mouse_x - x);
            var _start = _dir == -1 ? 0 : 360;
            var _end = _dir == -1 ? 360 : 0;
			card3dTween = TweenFire(self, EaseOutBack, TWEEN_MODE_ONCE, true, 0, 1, "card3dRot", _start, _end);
		}
		mouseTime = 0; //Reset Mouse Time
	}
	
	//Set Size
	scaleTargetX = 1;
	scaleTargetY = 1;
	
	//Depth
	depth = startDepth - cardId;
	
} else { //Grab Effect
	
	//Shadow
	shadowOffsetY = 11;
	shadowTargetSize = 0.12;
	
	//Set Scale
	scaleTargetX = 1.1;
	scaleTargetY = 1.1;
	
	//3D Rotation
	var _3dRotDir = clamp((xprevious-x), -40, 40);
	card3dRot = lerp_dt(card3dRot, _3dRotDir, .2);//angelVel
	
	//Depth
	depth = startDepth - 10;
}

//Ease Angel Based On Velocity
var _ang = clamp(targetAngle + (xprevious - x), -90, 90);
angelVel = spring(image_angle, angelVel, _ang, .6, .5);
image_angle += angelVel;

//Ease Scale
image_xscale = lerp_dt(image_xscale, scaleTargetX, .3);
image_yscale = lerp_dt(image_yscale, scaleTargetY, .3);

//Set Shadow
var _shadowMult = grabbed ? .05 : .02;
if shadowFollowRoomCenter then shadowTargetX = clamp((x - (room_width/2))*_shadowMult, -maxShadow, maxShadow);
shadowX = lerp_dt(shadowX, shadowTargetX + shadowOffsetX, .2);
shadowY = lerp_dt(shadowY, shadowTargetY + shadowOffsetY, .2);
shadowSize = lerp_dt(shadowSize, shadowTargetSize, .2);

#endregion
