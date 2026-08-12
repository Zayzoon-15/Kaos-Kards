
/// @desc  A function holding all the effects an enemy can do
/// All effects happen 
function EnemyEffects()
{
    
    /// @desc Creates a message for the player (testing func)
    /// @param {string} _text The text
    /// @param {bool} _inGame If it should alert in game or the pc
    static SendMessage = function(_text = "text",_inGame = true)
    {
        var _func = _inGame ? createAlertMessage : show_message;
        timeSourceCreate(1,_func,[_text]);
    }
    
    
    /// @desc Decreases the players hand size
    static SmallerHand = function()
    {
        instance_create_depth(0,0,0,oEnemyEffectSmallHand);
    }
    
    
    /// @desc Stops the player from using the last cards they used
    static BanLastCards = function()
    {
        //Temporaly Ban Cards
        for (var i = 0; i < array_length(global.lastCardsPlayed.player); i++) {
        	if global.lastCardsPlayed.player[i] != -1
            {
                array_push(global.cardsTempBanned.player,global.lastCardsPlayed.player[i]);
                print(global.lastCardsPlayed.player[i].index);
            }
        }
        
        //Show Alert
        timeSourceCreate(1,createAlertMessage,["Disabled Last Used Cards", 60]);
    }
    
    
    
}