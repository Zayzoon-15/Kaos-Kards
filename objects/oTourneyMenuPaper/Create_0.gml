#region --- Paper Sway ---

//Create Paper Bits
paperBits = array_create(50,-1);
angDir = 1;

#endregion




//Function
change = function(_info = tourneyInfo.cameos,_dir = 1)
{
    sprite_index = _info.sprite;
    paperBits = array_create(50,-1);
    angDir = _dir != 0 ? -_dir : 1;
    //image_angle = -25 * _dir;
}