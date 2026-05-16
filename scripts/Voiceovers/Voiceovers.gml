/// @desc Creates info for the voice of the announcer AKA Tri
/// @param {asset.GMSound} _sound The sounds to play
/// @param {string} _text The text to show when the sound is played (The text can be an array if you want multiple lines)
/// @param {array<real>} name The timing for the text to show. It's base on the text so the array must match
function voiceCreate(_sound,_text,_textTime = [0]) constructor 
{
    sound = _sound;
    text = _text;
    textTime = _textTime;
}


function initVoices()
{
    
    globalvar voicePack;
    voicePack = {
        
        //Combo
        combo : [
            voiceInfo.womboCombo,
            voiceInfo.comboNice,
            voiceInfo.comboSweet,
            voiceInfo.comboBurp
        ],
        
        //Kaos Room
        kaosStarting : [
            voiceInfo.kaosBegin,
            voiceInfo.downForKaos
        ],
        
        winning : [
            voiceInfo.dank,
            voiceInfo.bringinKaos,
            voiceInfo.hurtPretty,
            voiceInfo.hurtMark,
            voiceInfo.touchDial
        ],
        
        losing : [
            voiceInfo.mild,
            voiceInfo.tryHarder,
            voiceInfo.hurtCheck,
            voiceInfo.hurtOh
        ],
        
        neutral : [
            voiceInfo.dank
        ],
        
    }
    
    
}