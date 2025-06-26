
function getChasoAction()
{
    switch (struct.cardAction) {
        
        case "ChaosSwitch":
            chaosSwap(struct);
        break;
        
        case "ChaosDestroy":
            chaosDestroy(struct);
        break;
        
        case "ChaosSwap":
            chaosSwap(struct);
        break;
        
        case "ChaosWheat":
            chaosWheat(struct);
        break;
        
        case "ChaosHalf":
            chaosHalf(struct);
        break;
        
        case "ChaosHigh":
            chaosHigh(struct);
        break;
    }
}