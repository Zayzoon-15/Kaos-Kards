
//Get Health Inst
healthInst = noone;
with oHealthBar
{
    if target == other.target then other.healthInst = self.id;
}

//Set Position
x = healthInst.bbox_right + 10;
y = healthInst.y;
targetY = y;