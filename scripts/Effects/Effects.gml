
//Enum
enum EFFECT_TYPE {
	ASS,
    HARM,
}

//Set Effects
globalvar attackEffects;

attackEffects = {
    shield : new createAttackEffect("Shield",sShieldIcon,#6DD0F7,EFFECT_TYPE.ASS),
    poison : new createAttackEffect("Poison",sPoisonIcon,c_fuchsia,EFFECT_TYPE.HARM),
    fire : new createAttackEffect("Fire",sFireIcon,c_orange,EFFECT_TYPE.HARM,[2,4],[.7,1]),
    pee : new createAttackEffect("Piss",sPissIcon,c_yellow,EFFECT_TYPE.ASS),
};

