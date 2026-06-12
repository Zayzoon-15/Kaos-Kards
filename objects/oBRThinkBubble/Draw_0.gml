//Draw Bubble
draw_self();


//Text Setup
textShow += textShowSpd;
textSetup(fonts.BRThink,fa_center,fa_top);
var _string = string_copy(text,0,textShow);
var _charWidth = 30;
var _charHeight = 45;
var _cursorX = 0;
var _cursorY = 0;

//Draw Text
for (var i = 1; i < string_length(_string)+1; i++) {
	
    //Get Character
    var _char = string_copy(_string,i,1);
    
    //Wrap Around If Word Too Big
    if _char != " " and (i == 1 or string_copy(_string,i-1,1) == " ")
    {
        var _word = "";
        var _k = i;
        
        //Get Full Word
        while _k <= string_length(_string)
        {
            //Get Character
            var _nextChar = string_copy(_string,_k,1);
            if _nextChar == " " then break;
            
            //Add To Word
            _word += _nextChar;
            _k ++;
        }
        
        //Move To Next Line If Word Too Big
        if _cursorX + string_width(_word) > maxWidth
        {
            
            _cursorX = 0;
            _cursorY += _charHeight;
        }
    }
    
    //Add Animations
    if array_length(textAnims)-1 < i {
        array_set(textAnims,i,{
            curvePos : 0,
            playedSound : false,
            xOffset : 0,
            yOffset : 0,
            offsetSineX : random(100),
            offsetSineY : random(100),
        });
    }
    
    //Set Animation
    var _curvePos = textAnims[i].curvePos;
    _curvePos += curveSpd;
    textAnims[i].curvePos = _curvePos;
    
    //Play Sound
    if _curvePos >= .4 and !textAnims[i].playedSound and !forceShow
    {
        audioPlaySfx(snComboTick,1.4,1.6,.2);
        textAnims[i].playedSound = true;
    }
    
    //Set Offset
    textAnims[i].offsetSineX += 0.03;
    textAnims[i].offsetSineY += 0.03;
    textAnims[i].xOffset = sineBetween(textAnims[i].offsetSineY,5,-2,2);
    textAnims[i].yOffset = sineBetween(textAnims[i].offsetSineX,5,-2,2);
    
    
    //Get Values
    var _x = bbox_left + _cursorX;
    var _y = bbox_top + _cursorY + animGetValue(AnimationCurve8,_curvePos,"y")*20;
    var _xscale = animGetValue(AnimationCurve8,_curvePos,"xscale");
    var _yscale = animGetValue(AnimationCurve8,_curvePos,"yscale");
    draw_set_alpha(animGetValue(AnimationCurve8,_curvePos,"alpha")*image_alpha);

    //Draw Text
    draw_text_transformed(_x + textAnims[i].xOffset,_y + textAnims[i].yOffset,_char,_xscale,_yscale,0);
    
    //Reset Alpha
    draw_set_alpha(1);
    
    //Set Cursor
    _cursorX += _charWidth;
}

//Draw Click Thing
if textShow > string_length(text)+10
{
    textSetup(fnMain,fa_right,fa_bottom,c_white,clickAlpha*image_alpha);
    if clickAlpha < 1 then clickAlpha += .05;
    draw_text(bbox_right,bbox_bottom,"Click To Close");
}

//Reset Draw
drawReset();