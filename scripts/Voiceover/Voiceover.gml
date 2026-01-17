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
    kaosBegin : new voiceCreate(voKaosBegin,"Let the chaos... begin."),
    
    //Great Job
    dank : new voiceCreate(voDank,"That was DANK!"),
    bringinKaos : new voiceCreate(voBringinKaos,["Woah!", "These cards sure are bringing some...", "chaos.", "See what I did there?"],[0,.5,2.8,4.2]),
    
    //Bad Job
    mild : new voiceCreate(voMild,["And the crowd goes...","mild."],[0,1.5]),
    tryHarder : new voiceCreate(voTryHarder,"Gonna have to try a little harder than that if you wanna win."),
    
    //Combo
    comboNice : new voiceCreate(voComboNice,"Nice combo!"),
    comboSweet : new voiceCreate(voComboSweet,"Sweet combo!"),
    womboCombo : new voiceCreate(voWomboCombo,"WOMBO COMBO!!!"),
    
    //Hurt
    hurtCheck : new voiceCreate(voHurtCheck,"Ugh... might want to get that checked out."),
    hurtMark : new voiceCreate(voHurtMark,"Ooh- that's gonna leave a mark."),
    hurtOugh : new voiceCreate(voHurtOugh,"OUGH!"),
    hurtPretty : new voiceCreate(voHurtPretty,"That wasn't pretty!"),
    
    #region Actions
    
    //Heal
    healAnymore : new voiceCreate(voHealAnymore,"Bro, who the hell heals anymore!"),
    healMid : new voiceCreate(voHealMid,"Look at this guy, healing mid-battle."),
    
    //Shield
    shield : new voiceCreate(voShieldUp,"OOH! Keep your shields up."),
    
    //Poison
    poisonSizz : new voiceCreate(voPoisonSizz,"OH MY GOD! Why is it sizzling!"),
    poisonInfect : new voiceCreate(voPoisonInfect,"Oughh... That's definitely infected..."),
    poisonShip : new voiceCreate(voPoisonShip,"God this is one, toxic relationship huh."),
    
    //Sticky Hand
    stickyGoo : new voiceCreate(voStickyGoo,"Oouei gooey!"),
    
    //Brawl
    brawlFreak : new voiceCreate(voBrawlFreak,"That's so freakin' retro!"),
    brawlRetro : new voiceCreate(voBrawlRetro,"Retro!!!"),
    brawlTimes : new voiceCreate(voBrawlTimes,["God, I remember playing that as a kid.","Good times, good times"],[0,1.80]),
    
    #endregion
    
    //Random
    tacoTime : new voiceCreate(voTacoTime,["I love Taco Time","But I can't eat it or else I'll get","Fat."],[0,2.20,4.61]),
};