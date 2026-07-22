
//Sway Values
var damping = .82;
var stiffness = .08;
var maxVel = 40;

//Draw Paper Bits
var _baseX = x// - sprite_width/2;
var _baseY = y;
for (var i = 0; i < array_length(paperBits); i++) {
	
    //Last Index Info
    var _lastInfo = -1;
    if i != 0 and paperBits[i - 1] != -1
    {
        _lastInfo = paperBits[i - 1];
    }
    
    //Fill Information If Empty
    var _info = paperBits[i];
    if _info == -1
    {
        //Set Info
        _info = {
            angle : 0,
            angleVel : (5 + .5 * i)*angDir,
            xscale : 1,
            yscale : 1,
            color : image_blend//random(c_white), //Set random color for debugin
        };
        
        print(_info.angleVel, i,angDir);
        _info.angleVel = clamp(_info.angleVel,-maxVel,maxVel);
        print(_info.angleVel, i);
    }
    
    //for (i in 0...group.members.length)
    //{
        //var movementTilt = FlxMath.bound(moveDeltaX + (prevAngle < 0 ? -moveDeltaY : moveDeltaY), -180, 180);
//
        //var targetAngle = (prevAngle * 1.25) + movementTilt;
//
        //var angleDiff = (targetAngle - _angles[i]) * 2;
//
        //deltas[i] += angleDiff;
        //deltas[i] *= Math.pow(0.905, elapsed * 120);
//
        //_angles[i] += deltas[i] * elapsed;
//
        //prevAngle = _angles[i];
    //}
		//prevsPoses[0] = group.x;
		//prevsPoses[1] = group.y;
	//}
    
    
    //var floorY = this.y + this.height - 40;
    //for (i => group in [stickPartsBack, stickPartsFront])
    //{
        //var baseX = group.x;
        //var baseY = group.y;
        //var spr;
        //for (j in 0...group.members.length)
        //{
            //spr = group.members[j];
            //spr.x = baseX;
            //spr.y = baseY;
            //spr.angle = _angles[i][j] + startAngle;
            //spr.updateTrig();
            //var offsetY = (spr.height - 10);
            //if (floorY <= (baseY + offsetY * spr._cosAngle))
            //{
                //spr.angle = (i == 0 ? 70 : 30);
                //spr.updateTrig();
            //}
            //baseX -= offsetY * spr._sinAngle;
            //baseY += offsetY * spr._cosAngle;
        //}
    //}
    //_oldTicks = FlxG.game.ticks;
    
    #region --- Sway Animation ---
    
    	////Rotate Normally
    //var _diff = angle_difference(0, image_angle);
    //var _force = -image_angle * stiffness;
    //angleVel += _diff * stiffness;
    //
    
    var _diff = angle_difference(0,_info.angle);
    var _force = -_info.angle * stiffness
    _info.angleVel += _diff * stiffness;
    
    _info.angleVel *= damping;
    _info.angle += _info.angleVel;
    
    #endregion
    
    //Sprite Parts
    var _top = (sprite_height / array_length(paperBits)) * i;
    var _height = (sprite_height / array_length(paperBits));
    var _x = _baseX;
    var _y = _baseY;

    
    //Get Position
    var _offsetX = 0 - sprite_xoffset;
    var _offsetY = _top - sprite_yoffset;
    var _newX = _x + lengthdir_x(_offsetX, _info.angle) + lengthdir_x(_offsetY, _info.angle - 90);
    var _newY = _y + lengthdir_y(_offsetX, _info.angle) + lengthdir_y(_offsetY, _info.angle - 90);
    
    //Draw Bit Shadow
    draw_sprite_general(sTourneyArtShadow, image_index, 0,
    _top, sprite_width, _height + (i == array_length(paperBits)-1 ? 0 : 7.1),
    _newX, _newY, _info.xscale, _info.yscale, _info.angle,
    _info.color, _info.color, _info.color, _info.color, image_alpha);
    
    //Draw Bit
    draw_sprite_general(sprite_index, image_index, 0,
    _top, sprite_width, _height + (i == array_length(paperBits)-1 ? 0 : 5.5),
    _newX, _newY, _info.xscale, _info.yscale, _info.angle,
    _info.color, _info.color, _info.color, _info.color, image_alpha);
    
    //Move Base
    _baseX += 0;
    _baseY += 0//_height
    
    //Set New Info To Array
    paperBits[i] = _info;
}

