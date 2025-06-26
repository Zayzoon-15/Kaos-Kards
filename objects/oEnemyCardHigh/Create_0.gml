// Inherit the parent event
event_inherited();

//Info
cardInfo = kaosCardHigh;

cardAction = "ChaosHigh";

var _struct = {
    cardInfo : {info:cardInfo,sprite:sprite_index},
    cardAction : cardAction,
    value : currentRange
}


if isReal
{
    enemyChaosCard = _struct;
} else enemyChaosCard = undefined;

if !isReal
{
    instance_destroy();
}