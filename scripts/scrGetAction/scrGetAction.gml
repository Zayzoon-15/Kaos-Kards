function getEnemyAction()
{
    switch (struct.cardAction) {
        
        case "Flame":
            enemyFlame(struct.value);
        break;
        
        case "Laser":
            enemyLaser(struct.value);
        break;
        
        case "Heal":
            enemyHeal(struct.value);
        break;
        
        case "Shield":
            enemyShield(struct.value);
        break;
        
        case "Bread":
            enemyBread(struct.value);
        break;
        
        case "Slash":
            enemySlash(struct.value);
        break;
        
        case "Poison":
            enemyPoison(struct.value);
        break;
        
        case "Freeze":
            enemyFreeze(struct.value);
        break;
        
        case "Fist":
            enemyFist(struct.value);
        break;
    }
}

function GetPlayerAction()
{
    switch (struct.cardAction) {
    
    case "Flame":
        playerFlame(struct.value);
    break;
    
    case "Laser":
        playerLaser(struct.value);
    break;
    
    case "Heal":
        playerHeal(struct.value);
    break;
    
    case "Shield":
        playerShield(struct.value);
    break;
    
    case "Bread":
        playerBread(struct.value);
    break;
    
    case "Slash":
        playerSlash(struct.value);
    break;
        
    case "Poison":
        playerPoison(struct.value);
    break;
    
    case "Freeze":
        playerFreeze(struct.value);
    break;
        
    case "Fist":
        playerFist(struct.value);
    break;
}
}