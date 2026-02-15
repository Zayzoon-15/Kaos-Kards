///@desc Manages the games save system
// Use SaveFile.GameSave() to save the game save
// Use SaveFile.GameLoad() to load the game save
function SaveFile()
{
    #region Custom Functions | DON'T TOUCH |
    
    ///@desc Saves the given data
    ///@param {string} _data The save data
    ///@param {string} _filename The target file name
    ///@param {bool} _protect If the save file should be encrypted
    static _saveFile = function(_data, _filename,_protect = false)
    {
        //Get Info
        var _string = json_stringify(_data);
    
        //Encode Save
        if _protect
        {
            //Create Encoded Buffer
            var _encodeBuffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
            buffer_write(_encodeBuffer, buffer_string, _string);
            
            //Encode The Buffer
            _string = buffer_base64_encode(_encodeBuffer, 0, buffer_get_size(_encodeBuffer));
            buffer_delete(_encodeBuffer);
        }
    
        //Save Buffer
        var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
        buffer_write(_buffer, buffer_string, _string);
        buffer_save(_buffer, _filename);
        buffer_delete(_buffer);
        
    }
    
    ///@desc Loads the given save file
    ///@param {string} _filename The target file name
    ///@param {bool} _protected If the save file is encrypted
    ///@returns {struct} The save data
    static _loadFile = function(_filename,_protected = false)
    {
        if file_exists(_filename)
        {
            //Get Info
            var _buffer = buffer_load(_filename);
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);
            
            //Decode Buffer
            if _protected
            {
                var _decodeBuffer = buffer_base64_decode(_string);
                _string = buffer_read(_decodeBuffer, buffer_string);
                buffer_delete(_decodeBuffer);
            }
            
            //Return Save
            return json_parse(_string);
            
        } else return undefined;
    }
    
    
    
    #endregion
    
    
    
    #region Game
    
    static GameSave = function()
    {
        //Make Save Data
        var _saveData = {};
        
        //Save Deck Info
        var _saveDeck = function()
        {
            var _deck = [];
            for (var i = 0; i < array_length(playerDeck); i++) {
                
                //Get Card
            	var _card = playerDeck[i];
                
                //Get Correct Struct And Keys
                var _keys = [];
                var _struct = {};
                switch (_card.type) {
                	case CARDTYPES.ACTION: 
                        _struct = actionCards;
                        _keys = struct_get_names(actionCards);
                    break;
                	case CARDTYPES.KAOS: 
                        _struct = kaosCards;
                        _keys = struct_get_names(kaosCards);
                    break;
                	case CARDTYPES.DICE: 
                        _struct = diceCards;
                        _keys = struct_get_names(diceCards);
                    break;
                }
                
                //Set Info
                var _targetKey = noone;
                for (var k = 0; k < array_length(_keys); k++) {
                	var _id = struct_get_variable(_struct,_keys[k]);
                    
                    if _id.name == _card.name
                    {
                        _targetKey = _keys[k];
                    }
                }
                
                //Put Card In Deck
                var _info = {
                    key : _targetKey,
                    type : _card.type
                }
                array_push(_deck,_info);
            }
            
            return _deck;
        }
        
        
        ///Save Info
        
        //Deck
        struct_set(_saveData,"PlayerDeck",_saveDeck());
        
        
        //Save To File
        _saveFile(_saveData,"GameSave.kaos",true);
    }
    
    static GameLoad = function()
    {
        //Get Save Data
        var _saveData = _loadFile("GameSave.kaos",true);
        
        
        //Load Deck Info
        var _loadDeck = function()
        {
            var _deck = [];
            for (var i = 0; i < array_length(playerDeck); i++) {
                
                //Get Card
            	var _card = playerDeck[i];
                
                //Get Correct Struct
                var _struct = {};
                switch (_card.type) {
                	case CARDTYPES.ACTION: _struct = actionCards; break;
                	case CARDTYPES.KAOS: _struct = kaosCards; break;
                	case CARDTYPES.DICE: _struct = diceCards; break;
                }
                
                //Put Card In Deck
                var _info = struct_get(_struct,_card.key);
                array_push(_deck,_info);
            }
            
            return _deck;
        }
        
        
        ///Load Info
        
        //Deck
        if is_struct(_saveData) and struct_exists(_saveData,"PlayerDeck")
        {
            playerDeck = struct_get_variable(_saveData,"PlayerDeck",playerDeck);
            playerDeck = _loadDeck();
        }
        
        
        //Set Deck Amount
        global.deckCardAmount = array_length(playerDeck);
        
    }
    
    #endregion
    
    
    
    #region Setings
    
    static SettingsSave = function()
    {
        //Make Save Data
        var _saveData = {};
        
        
        ///Save Info
        
        //Audio
        struct_set(_saveData,"MasterVol",global.masterVol);
        struct_set(_saveData,"SfxVol",global.sfxVol);
        struct_set(_saveData,"MusicVol",global.musicVol);
        struct_set(_saveData,"VoiceVol",global.voiceVol);
        struct_set(_saveData,"Mute",global.unfocusMute);
        struct_set(_saveData,"Voiceover",global.voiceover);
        struct_set(_saveData,"Subtitles",global.subtitles);
        
        //Video
        struct_set(_saveData,"Resolution",global.currentRes);
        struct_set(_saveData,"Window",global.window);
        struct_set(_saveData,"Vsync",global.vSync);
        struct_set(_saveData,"Particle",global.partSelection);
        struct_set(_saveData,"SubtitleStyle",global.subtitlesStyle);
        
        //Input
        struct_set(_saveData,"KeyDiscard",global.keyDiscard);
        struct_set(_saveData,"KeyFullscreen",global.keyFullscreen);
        struct_set(_saveData,"KeyPause",global.keyPause);
        struct_set(_saveData,"KeyDebug",global.keyDebug);
        struct_set(_saveData,"MobilePress",global.mobilePress);
        
        //Game
        struct_set(_saveData,"GameSpeed",global.gameSpeed);
        
        //Save To File
        _saveFile(_saveData,"SettingsSave.kaos");
    }
    
    static SettingsLoad = function()
    {
        //Get Save Data
        var _saveData = _loadFile("SettingsSave.kaos");
        
        
        ///Load Info
        
        //Audio
        global.masterVol = struct_get_variable(_saveData,"MasterVol",50);
        global.sfxVol = struct_get_variable(_saveData,"SfxVol",50);
        global.musicVol = struct_get_variable(_saveData,"MusicVol",50);
        global.voiceVol = struct_get_variable(_saveData,"VoiceVol",50);
        global.unfocusMute = struct_get_variable(_saveData,"Mute",true);
        global.voiceover = struct_get_variable(_saveData,"Voiceover",true);
        global.subtitles = struct_get_variable(_saveData,"Subtitles",true);
        
        //Video
        global.currentRes = struct_get_variable(_saveData,"Resolution",2);
        global.window = struct_get_variable(_saveData,"Window","Window");
        global.vSync = struct_get_variable(_saveData,"Vsync",true);
        global.partSelection = struct_get_variable(_saveData,"Particle",0);
        global.subtitlesStyle = struct_get_variable(_saveData,"SubtitleStyle",global.subtitlesStyle);
        
        //Input
        global.keyDiscard = struct_get_variable(_saveData,"KeyDiscard",ord("Z"));
        global.keyFullscreen = struct_get_variable(_saveData,"KeyFullscreen",vk_f11);
        global.keyPause = struct_get_variable(_saveData,"KeyPause",vk_escape);
        global.keyDebug = struct_get_variable(_saveData,"KeyDebug",220);
        global.mobilePress = struct_get_variable(_saveData,"MobilePress",true);
        
        //Game
        global.gameSpeed = struct_get_variable(_saveData,"GameSpeed",1);
        
    }
    
    #endregion
    
    
}
