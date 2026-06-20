info = enemyInfo.dog;

anim = new animManager(info);
anim.play("idle");

//Animation Text
currentText = "Press Space To Type An Animation";
startingText = currentText;
typing = false;
typingEnemy = false;

//Enemy Text
enemyCurrentText = "Press Alt To Type An Enemy";
enemyStartingText = enemyCurrentText;