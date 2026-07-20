//Press
canPress = false;
pressed = false;

//Scale
xscale = 1;
yscale = 1;
scale = 1;

//Offset
xOffset = 0;
yOffset = 0;
shadowOffset = 0;

//Set A Global Var
if global.lastRoom != rDeckBuilder1 and global.lastRoom != rDeckBuilder2
{
    variable_global_set("DBSavedRoom",global.lastRoom);
}
