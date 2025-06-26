

function saveGame()
{
    //Make Save
    var _saveData = array_create(0);
    
    //Save Stuff
    var _saveInfo = {
        //Settings
        volume : global.masterVol,
        fullscreen : global.fullscreen,
        
        //Enemies
        dawg : global.beatDawg,
        angel : global.beatAngel,
        buggy : global.beatBuggy,
        alien : global.beatAlien,
        beer : global.beatBeer,
        everyone : global.beatEveryone,
        
        //Game
        playerCards : playerDeck,
        playerHand : global.playerHandSize,
        discard : global.discardSpace,
        bread : global.breadFirst
    }
    
    //Put in Save
    array_push(_saveData,_saveInfo);
    
    //Turn into a JSON
    var _string = json_stringify(_saveData);
    var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
    buffer_write(_buffer,buffer_string,_string);
    buffer_save(_buffer,"Kaos.save");
    buffer_delete(_buffer);
}


function loadSave()
{
    if file_exists("Kaos.save")
    {
        var _buffer = buffer_load("Kaos.save");
        var _string = buffer_read(_buffer,buffer_string);
        buffer_delete(_buffer);
        
        var _loadData = json_parse(_string);
        
        while array_length(_loadData) > 0
        {
            var _loadInfo = array_pop(_loadData);
            
            //Settings
            global.masterVol = _loadInfo.volume;
            global.fullscreen = _loadInfo.fullscreen;
            
            //Enemies
            global.beatDawg = _loadInfo.dawg;
            global.beatAngel = _loadInfo.angel;
            global.beatBuggy = _loadInfo.buggy;
            global.beatAlien = _loadInfo.alien;
            global.beatBeer = _loadInfo.beer;
            global.beatEveryone = _loadInfo.everyone;
            
            //Game
            playerDeck = _loadInfo.playerCards;
            global.playerHandSize = _loadInfo.playerHand;
            global.discardSpace = _loadInfo.discard;
            global.breadFirst = _loadInfo.bread;
            
        }
    }
}