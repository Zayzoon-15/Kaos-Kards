///@desc Action

//Do Action
card.info.action(self.id,targetEnemy);

//Destroy Kaos Card
if card.info.type == CARDTYPES.KAOS
{
    alarm[1] = card.info.destroyTime;
}