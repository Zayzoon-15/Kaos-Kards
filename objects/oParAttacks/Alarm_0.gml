///@desc Applies Options

//Flip Sprite
if flipSprite
{
    if targetEnemy then image_yscale = 1; else image_yscale = -1;
}

//Change Positon
if posBasedOnCard
{
    if targetEnemy then y = newYPos[0] else y = newYPos[1];
}
