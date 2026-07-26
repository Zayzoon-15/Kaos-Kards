//Sway Values
var damping = .8;
var stiffness = .04;
var maxVel = 40;

//Draw Paper Bits
var _baseX = x// - sprite_width/2;
var _baseY = y;
var _pullAmount = random_range(.07,.13);
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
            angleVel : (1 + _pullAmount*i)*angDir,//(5 + .5 * i)*angDir,
            xscale : 1,
            yscale : 1,
            color : image_blend//random(c_white), //Set random color for debugin
        };
        
        _info.angleVel = clamp(_info.angleVel,-maxVel,maxVel);
    }
    
    #region --- Sway Animation ---
    
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
    _top, sprite_width, _height + (i == array_length(paperBits)-1 ? 0 : 0), //7.15
    _newX, _newY, _info.xscale, _info.yscale, _info.angle,
    _info.color, _info.color, _info.color, _info.color, image_alpha);
    
    //Draw Bit
    draw_sprite_general(sprite_index, image_index, 0,
    _top, sprite_width, _height + (i == array_length(paperBits)-1 ? 0 : 2), //5
    _newX, _newY, _info.xscale, _info.yscale, _info.angle,
    _info.color, _info.color, _info.color, _info.color, image_alpha);
    
    //Move Base
    _baseX += 0;
    _baseY += 0//_height
    
    //Set New Info To Array
    paperBits[i] = _info;
}

