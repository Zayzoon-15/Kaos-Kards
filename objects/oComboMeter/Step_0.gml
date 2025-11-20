//Set Value
value = variable_global_get(targetVar);

//Get Percent
var _percent = value / 100;
percent = lerp(percent,_percent,.2);

//Set Position
x = getPosToWindow(false);

//Draw Info
tipBoxString = $"Your Combo Meter\n{value}%";
if target == "Enemy" then tipBoxString = $"Enemies Combo Meter\n{value}%";
drawTipBox(tipBoxString, false, true);

//Set Image
image_index = 6*_percent;
arrowDir = 180*percent;

//Sounds
if value != lastValue
{
    //Reached Max
    if value == 100 then audioPlaySfx(snComboMax);
    
    //Hit Mark
    if floor(lastFrame) != floor(image_index) and value != 100
    {
        audioPlaySfx(snComboHit)
    }
    
    //Tick
    if tickCooldown <= 0
    {
        audioPlaySfx(snComboTick);
        tickCooldown = 8;
    }
}

tickCooldown --; //Reduce Tick

//Set Last Value
lastValue = value;
lastFrame = image_index;