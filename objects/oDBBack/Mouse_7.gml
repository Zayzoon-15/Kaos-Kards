//Start Transition
if canPress and pressed and !instance_exists(oDBCardTrans)
{
    with oDeckBuilder
    {
        startTrans();
    }
}