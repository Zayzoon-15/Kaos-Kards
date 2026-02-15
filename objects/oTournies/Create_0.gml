//Set Target Enemy
global.currentEnemy = undefined;

//Setup Character
sprite_index = info.sprite;

//Animation
animInfo = info.animInfo;
frame = 0;
currentAnim = 0;
animationEnd = false;
shake = 0;

//Button
pressed = false;
mobilePress = false;
selected = false;
canHover = true;

//Image
xscale = .5;
yscale = .5;
boxY = 0;

//Shadow
shadowY = 0;

changeAnim = function(_anim)
{
    //Set clip
    var _clip = variable_struct_get(info.animInfo, _anim);
    
    //Switch Animation
    if _clip != undefined and currentAnim != _clip
    {
        currentAnim = _clip;
        frame = 0;
        animationEnd = false;
    }
}