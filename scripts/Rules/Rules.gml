enum ACTION_EVENTS
{
    MATCH_START,
    EVERY_ROUND,
    STEP,
    
}

function Rule(_desc = "Blank Rule", _action = function(){}, _actionEvent = ACTION_EVENTS.EVERY_ROUND) constructor {
    desc = _desc;
    action = _action;
    event = _actionEvent;
}

function initRules(){

    globalvar ruleInfo;
    ruleInfo = {
        
        deckShuffle : new Rule("Decks are shuffled after every round",function(){
            with oDeck
            {
                deck = array_shuffle(deck);
                print("Deck Shuffled");
            }
        }),
        
        timeLimit : new Rule(function(){
            
            //Get Time
            var _time = global.currentTourney.timeLimit;
            var _mins = _time div 60;
            var _secs = _time mod 60;
            
            //Add Zeros If Time Too Short
            if _mins < 10 then _mins = $"0{_mins}";
            if _secs < 10 then _secs = $"0{_secs}";
            
            return $"Time limit when choosing cards (Time limit: {_mins}:{_secs})"}
        ),
        
        
    }
    
    
    
    
}