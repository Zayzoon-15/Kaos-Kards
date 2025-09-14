
//Enum
enum EFFECT_TYPE {
	ASS,
    HARM,
}

//Set Effects
globalvar attackEffects;

attackEffects = {
    shield : new createAttackEffect("Shield",sShieldIcon,#6DD0F7,EFFECT_TYPE.ASS),
    poison : new createAttackEffect("Poison",sPoisonIcon,c_fuchsia,EFFECT_TYPE.HARM,[.5,1.5],[3,4]),
    fire : new createAttackEffect("Fire",sFireIcon,c_orange,EFFECT_TYPE.HARM,[1.5,2.5],[3,5]),
};

