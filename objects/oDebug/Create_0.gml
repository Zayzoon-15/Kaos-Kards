debugMode = false;
show_debug_overlay(debugMode);


//Debug Vars
global.debugCard = "NONE";
global.debugBRItem = "NONE";
global.debugMenu = {
    cards : {
        easeWithGrab : false,
        easeType : "Lerp",
        easeTypeRot : "Lerp",
        cardEaseValue : .3,
        cardSpringEaseValue : .5,
        cardSpringValue : .3,
        cardAngleEaseValue : .3,
        cardAngleSpringEaseValue : .6,
        cardAngleSpringValue : .5,
    }, 
    slots : {
        lookAtCards : true,
    }
};

//For Hurting Players
global.debugKillable = {
	player : true,
	enemy : true
}