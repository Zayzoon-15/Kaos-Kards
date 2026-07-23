#region --- Paper Sway ---

//Create Paper Bits
paperAmounts = 100;
paperBits = array_create(paperAmounts,-1);
angDir = 1;

#endregion




//Function
change = function(_info = tourneyInfo.cameos,_dir = 1)
{
    sprite_index = _info.sprite;
    paperBits = array_create(paperAmounts,-1);
    angDir = _dir;
}