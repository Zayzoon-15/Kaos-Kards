//Shake Card While Charging Up
if sprite_index == sLaserStart
{
    
    laserShake += .05;
    
    if instance_exists(oAttackCard)
    {
        with oAttackCard
        {
            if id == other.cardId
            {
                shakeX += other.laserShake;
                shakeY += other.laserShake;
            }
        }
    }
    
    
    if instance_exists(oEnemyAttackCard)
    {
        with oEnemyAttackCard
        {
            if id == other.cardId
            {
                shakeX += other.laserShake;
                shakeY += other.laserShake;
            }
        }
    }
    
}

//Shake Card While Shooting
if sprite_index == sLaser
{
    if instance_exists(oAttackCard)
    {
        with oAttackCard
        {
            if id == other.cardId
            {
                shakeX += 1;
                shakeY += 1;
            }
        }
    }
    
    if instance_exists(oEnemyAttackCard)
    {
        with oEnemyAttackCard
        {
            if id == other.cardId
            {
                shakeX += 1;
                shakeY += 1;
            }
        }
    }
}

//Set Shake
if instance_exists(oAttackCard)
{
    with oAttackCard
    {
        if id == other.cardId
        { 
            
            other.shakeX = finalShake.x + (-finalShake.xDir*(shakeX - 1));
            other.shakeY = finalShake.y + (-finalShake.yDir*(shakeY - 1));
        }
    }
}

if instance_exists(oEnemyAttackCard)
{
    with oEnemyAttackCard
    {
        if id == other.cardId
        { 
            
            other.shakeX = finalShake.x + (-finalShake.xDir*(shakeX - 1));
            other.shakeY = finalShake.y + (-finalShake.yDir*(shakeY - 1));
        }
    }
}