

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
	
		//Set State
		state = CARD_STATES.PLACED;
		
		//Reset Rotation
		TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,30,"card3dRot",card3dRot,0);

		
		//Function
		onLetgo();
	}
}

//Set Hover
if touchingMouse() and hoverable {
	
	//Set Hover
	if !hover {
		onHover();
		hover = true;
	}
	
	//Darw Info
	drawCardText(info);
	
} else hover = false;

#endregion

#region --- Position

//Set Target Position If Following Placed Position
if followPlaced and !grabbed {
	targetX = placedX;
	targetY = placedY;
}

//Ease To Target Position
xspd = spring(x, xspd, targetX,.6,.3);
yspd = spring(y, yspd, targetY,.6,.3);
x += xspd;
y += yspd;

#endregion

#region --- Image ---

//Hover Effect
if !grabbed {
	
	//Hover
	if hover {
		
		//Set Card Offset
		cardOffsetY = lerp(cardOffsetY, -10, .2);
		
		//Set Shadow Properties
		shadowOffsetY = 8;
		shadowTargetSize = 0.06;
		
		//Increase Mouse Time
		mouseTime ++;
	
	} else {
		
		//Set Card Offset
		cardOffsetY = lerp(cardOffsetY, 0, .2);
		
		//Set Shadow Properties
		shadowOffsetY = 0;
		shadowTargetSize = 0.05;
		
		//3D Flip
		if mouseTime <= 2 and mouseTime > 0 {
			
			//Sound
			audio_stop_sound(snCardHover);
			audioPlaySfx(snCardFlip,.95,1.05);
			
			//Tween Flip
			var _dir = sign(mouse_x - x);
            var _start = _dir == -1 ? 0 : 360;
            var _end = _dir == -1 ? 360 : 0;
			card3dTween = TweenFire(self, EaseOutBack, TWEEN_MODE_ONCE, false, 0, 60, "card3dRot", _start, _end);
		}
		mouseTime = 0; //Reset Mouse Time
	}
	
	//Set Size
	scaleTargetX = 1;
	scaleTargetY = 1;
	
} else { //Grab Effect
	
	//Shadow
	shadowOffsetY = 11;
	shadowTargetSize = 0.12;
	
	//Set Scale
	scaleTargetX = 1.1;
	scaleTargetY = 1.1;
	
	
	//3D Rotation
	var _3dRotDir = clamp((xprevious-x)*3, -50, 50);
	card3dRot = lerp(card3dRot, _3dRotDir, .2);//angelVel
	
}

//Ease Angel Based On Velocity
var _ang = clamp(xprevious - x, - 90, 90);
angelVel = spring(image_angle, angelVel, _ang, .6, .5);
image_angle += angelVel;

//Ease Scale
image_xscale = lerp(image_xscale, scaleTargetX, .3);
image_yscale = lerp(image_yscale, scaleTargetY, .3);

//Set Shadow
if shadowFollowRoomCenter then shadowTargetX = clamp((x - (room_width/2))*.05, -10, 10);
shadowX = lerp(shadowX, shadowTargetX + shadowOffsetX, .2);
shadowY = lerp(shadowY, shadowTargetY + shadowOffsetY, .2);
shadowSize = lerp(shadowSize, shadowTargetSize, .2);

#endregion
