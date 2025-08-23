//Get Health Inst
healthInst = noone;
with oHealthBar
{
    if target == other.target then other.healthInst = self.id;
}