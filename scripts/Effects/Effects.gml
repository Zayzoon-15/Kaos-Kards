
//Enum
enum EFFECT_TYPE {
	ASS,
    HARM,
}

//Set Effects
globalvar effectInfo;

effectInfo = {
    shield : new createAttackEffect("Shield",sShieldIcon,#6DD0F7,EFFECT_TYPE.ASS),
    poison : new createAttackEffect("Poison",sPoisonIcon,c_fuchsia,EFFECT_TYPE.HARM,[.2,.7],[1.7,2.3],false,true),
    fire : new createAttackEffect("Fire",sFireIcon,c_orange,EFFECT_TYPE.HARM,[.3,1],[1.3,2]),
};

