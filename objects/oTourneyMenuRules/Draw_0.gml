draw_self();

//Draw Rules For Now
textSetup(font,fa_left,fa_top,c_black);

//Position
var _baseX = bbox_left + 50;
var _baseY = y + 40;

//String Info
var _string = ruleString;
var _charWidth = 12;
var _charHeight = 20;
var _cursorX = 0;
var _cursorY = 0;
var _linePos = 1;

//Curve
var _curveDist = 5;
var _curveCenter = _baseY + 45;

////Draw Text
//draw_text_ext_transformed(0,0,ruleString,_charHeight,maxWidth,1,1,0);

#region --- Shrink Text ---

//Set up
var _fullWord = "";
var _wId = 1;

//Get Full Word
while _wId <= string_length(ruleString)
{
    //Get Character
    var _nextChar = string_copy(ruleString,_wId,1);
    
    if _nextChar == "["
    {
        if string_copy(ruleString,_wId+1,1) == "n"
        {
            _nextChar = "\n";
            _wId += 2;
        }
    }
    
    //Add To Word
    _fullWord += _nextChar;
    _wId ++;
}

//Shrink Based On Length
textScale = 1;
while string_height_ext(ruleString,40*textScale,maxWidth/textScale) * textScale >= maxHeight
{
    textScale -= .01;
    _charHeight -= .01;
    _charWidth -= .01;
}

#endregion

//Draw Text
for (var i = 1; i < string_length(_string)+1; i++) {
	
    //Get Character
    var _char = string_copy(_string,i,1);
    
    //Wrap Around If Word Too Big
    if _char != " " and (i == 1 or string_copy(_string,i-1,1) == " ")
    {
        var _word = "";
        var _k = i;
        var _action = "";
        
        //Get Full Word
        while _k <= string_length(ruleString)
        {
            //Get Character
            var _nextChar = string_copy(ruleString,_k,1);
            if _nextChar == " " then break;
            
            if _char == "["
            {
                _action = string_copy(ruleString,_k+1,1);
                break;
            }
            
            //Add To Word
            _word += _nextChar;
            _k ++;
        }
        
        //Move To Next Line If Word Too Big
        if _cursorX + string_width(_word) > maxWidth or _action == "n"
        {
            _cursorX = 0;
            _cursorY += _charHeight;
            
            //Curve
            _linePos ++;
            _baseX += _baseY + _cursorY < _curveCenter ? _curveDist : -_curveDist;
            
            if _action == "n"
            {
                i += 2;
                continue;
            }
            
            //print(_cursorY,_curveCenter);
        }
    }
    
    //Get Values
    var _x = _baseX + _cursorX;
    var _y = _baseY + _cursorY;
    
    //Decrease Size
    var _cursorPos = _y
    while _cursorPos > bbox_bottom {
    	textScale -= .01;
        _cursorPos -= .01;
    }
    
    //Draw Text
    draw_text_transformed(_x,_y,_char,textScale,textScale,0);
    
    //Reset Alpha
    draw_set_alpha(1);
    
    //Set Cursor
    _cursorX += _charWidth;
}


//Reset
drawReset();