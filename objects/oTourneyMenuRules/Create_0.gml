ruleString = "-Rules\n";

change = function(_info = tourneyInfo.cameos,_dir = 0)
{
    //Clear Rules
    ruleString = "";
    
    //Add Rules
    for (var i = 0; i < array_length(_info.rules); i++) {
    	
        var _rule = _info.rules[i];
        var _desc = is_string(_rule.desc) ? _rule.desc : _rule.desc();
        ruleString += $"- {_desc}\n";
        
    }
}