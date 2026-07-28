draw_self();

//Draw Rules For Now
textSetup(font,fa_left,fa_top,c_black);

//Position
var _baseX = bbox_left + 50;
var _baseY = y + 40;

//String Info
var _string = ruleString;
var _charWidth = 13;
var _charHeight = 20;
var _cursorX = 0;
var _cursorY = 0;
var _linePos = 1;

//Curve
var _curveDist = 15;
var _curveCenter = _baseY + 45;

//DEBUG
draw_rectangle(_baseX,_baseY,_baseX + maxWidth,_baseY + maxHeight,true);
draw_circle(_baseX,_curveCenter,5,false);

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
        while _k <= string_length(ruleString)
        {
            //Get Character
            var _nextChar = string_copy(ruleString,_k,1);
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
            
            //Curve
            _linePos ++;
            _baseX += _baseY + _cursorY < _curveCenter ? _curveDist : -_curveDist;
            print(_cursorY,_curveCenter);
        }
    }
    
    //Get Values
    var _x = _baseX + _cursorX;
    var _y = _baseY + _cursorY;
    
    //Draw Text
    draw_text_transformed(_x,_y,_char,textScale,textScale,0);
    
    //Reset Alpha
    draw_set_alpha(1);
    
    //Set Cursor
    _cursorX += _charWidth;
}


//Reset
drawReset();