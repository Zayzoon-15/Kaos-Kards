//Set Value
value = variable_global_get(targetVar);
value = floor(value);
percent = lerp(percent,value / 100,.2);

//Set Position
x = getPosToWindow(onRight);

//Draw Info
tipBoxString = $"Your Combo Meter\n{value}%";
if target == "Enemy" then tipBoxString = $"Enemies Combo Meter\n{value}%";
drawTipBox(tipBoxString, tipOnTop, true);

//Set Image
image_index = 0;
if value >= 12 then image_index = 1;
if value >= 30 then image_index = 2;
if value >= 48 then image_index = 3;
if value >= 65 then image_index = 4;
if value >= 83 then image_index = 5;
if value >= 100 then image_index = 6;
arrowDir = 165*(percent-.02);

//Sounds
if value != lastValue
{
    //Reached Max
    if value >= 100 and lastValue < 100 {
		audioPlaySfx(snComboMax);
	}
    
    //Hit Mark
    if floor(lastFrame) != floor(image_index) and value > 100 {
        audioPlaySfx(snComboHit)
    }
    
    //Tick
    if tickCooldown <= 0 {
        audioPlaySfx(snComboTick);
        tickCooldown = 8;
    }
}

//Reduce Tick
tickCooldown --;

//Set Last Value
lastValue = value;
lastFrame = image_index;

//Clamp Values
global.playerComboMeter = clamp(global.playerComboMeter,0,100);
global.enemyComboMeter = clamp(global.enemyComboMeter,0,100);