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
        
        deckShuffle : new Rule("Decks are shuffled after every round"),
        timeLimit : new Rule(function(){return $"Time limit when choosing cards (Time limit: {global.currentTourney.timeLimit})\n(Currently in seconds will be changed)"}),
        
        
    }
    
    
    
    
}