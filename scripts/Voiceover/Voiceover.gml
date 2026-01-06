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


globalvar voiceInfo;
voiceInfo = {
    likeKaos : new voiceCreate(voLikeKoas,"Hey! Do you like chaos? Do you like cards?"),
    
    //Great Job
    dank : new voiceCreate(voDank,"That was DANK!"),
    
    #region Actions
    
    //Poison
    poisonSizz : new voiceCreate(voPoisonSizz,"OH MY GOD! Why is it sizzling!"),
    poisonInfect : new voiceCreate(voPoisonInfect,"Oughh... That's definitely infected..."),
    poisonGoo : new voiceCreate(voPoisonGoo,"Oouei gooey!"),
    poisonShip : new voiceCreate(voPoisonShip,"God this is one, toxic relationship huh."),
    
    
    #endregion
    
    //Random
    tacoTime : new voiceCreate(voTacoTime,["I love Taco Time","But I can't eat it or else I'll get","Fat."],[0,2.20,4.61]),
};