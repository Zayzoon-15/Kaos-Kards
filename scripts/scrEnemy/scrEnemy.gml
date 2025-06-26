

function getEnemyRoom()
{
    switch (targetEnemy) {
    	case "Dawg": return rDawgRoom;
        case "Angel": return rAngelRoom;
        case "Noone": return rEnemyRoom;
    }
}

function getEnemyHand()
{
    switch (targetEnemy) {
    	case "Dawg": return oDawgHand;
        case "Angel": return oAngelHand;
        case "Buggy": return oBuggyHand;
        case "Alien": return oAlienHand;
        case "Beer": return oBeerHand;
    }
}

function getEnemySprite(_enemy = targetEnemy)
{
    switch (_enemy) {
    	case "Dawg": return {idle:sDawgIdle,hurt:sDawgHurt,win:sDawgWin,lose:sDawgLose,locked:sEnemyBlank};
        case "Angel": return {idle:sAngelIdle,hurt:sAngelHurt,win:sAngelWin,lose:sAngelLose,locked:sAngelLocked};
        case "Buggy": return {idle:sBuggyIdle,hurt:sBuggyHurt,win:sBuggyWin,lose:sBuggyLose,locked:sBuggyLocked};
        case "Alien": return {idle:sAlienIdle,hurt:sAlienHurt,win:sAlienWin,lose:sAlienLose,locked:sAlienLocked}; 
        case "Beer": return {idle:sBeerIdle,hurt:sBeerHurt,win:sBeerWin,lose:sBeerLose,locked:sBeerLocked};
    }
}

function getEnemyInfo(_enemy=targetEnemy)
{
    switch (_enemy) {
    	case "Dawg": return {text:"Dog The Duck",boxSize:{width:80,height:30},locked : false};
        case "Angel": return {text:"Angel The Teen",boxSize:{width:80,height:30},locked : !global.beatDawg};
        case "Buggy": return {text:"Buggy The Bug",boxSize:{width:80,height:30},locked : !global.beatAngel};
        case "Alien": return {text:"Alan The Alien",boxSize:{width:80,height:30},locked : !global.beatBuggy};
        case "Beer": return {text:"Beers The Pickle",boxSize:{width:80,height:30},locked : !global.beatAlien};
    }
}