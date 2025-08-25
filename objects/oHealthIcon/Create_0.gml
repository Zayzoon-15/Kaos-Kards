//Get Health Inst
healthInst = noone;
with oHealthBar
{
    if target == other.target then other.healthInst = self.id;
}

//Set Position
x = healthInst.x;
y = healthInst.y;
targetX = healthInst.bbox_right + 10;
targetY = y;