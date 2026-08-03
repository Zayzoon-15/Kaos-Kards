//String
ruleString = "-Rules\n";

//Surface
//paperSurface = undefined;

//Text
textScale = 1;
sep = 30;
maxWidth = 170;
maxHeight = 120;
font = fonts.tourneyRule;

change = function(_info = tourneyInfo.cameos,_dir = 0)
{
    //Clear Rules
    ruleString = "";
    textScale = 1;
    draw_set_font(font);
    
    //Add Rules
    for (var i = 0; i < array_length(_info.rules); i++) {
    	
        var _rule = _info.rules[i];
        var _desc = is_string(_rule.desc) ? _rule.desc : _rule.desc();
        ruleString += $"-{_desc} [n]";
        
    }
    
    //Set Empty
    if ruleString == ""
    {
        ruleString = "-There are no rules for this tournament";
    }
    
    ////Shrink Scale
    //while string_height_ext(ruleString,sep*textScale,maxWidth/textScale) * textScale >= maxHeight
    //{
        //textScale -= .01;
    //}
}