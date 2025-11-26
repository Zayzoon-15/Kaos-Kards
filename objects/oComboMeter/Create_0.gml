//Hover
canHover = true;
tipBoxString = "";

//Image
lastFrame = 0;
arrowDir = 0;

//Sound
tickCooldown = 0;

//Get Target Variable
targetVar = "playerComboMeter";
if target == "Enemy" then targetVar = "enemyComboMeter";

//Value
value = variable_global_get(targetVar);
lastValue = value;
percent = value/100;