anim.update();
sprite_index = info.sprite;

//Input
if keyboard_check_pressed(vk_space)
{
    if currentText == startingText
    {
        currentText = "";
    }
    
    keyboard_string = currentText;
    typing = true;
    typingEnemy = false;
}

//Input
if keyboard_check_pressed(vk_alt)
{
    if enemyCurrentText == enemyStartingText
    {
        enemyCurrentText = "";
    }
    
    keyboard_string = enemyCurrentText;
    typing = false;
    typingEnemy = true;
}

//Type
if typing 
{
    currentText = keyboard_string;
    
    //Clear
    if keyboard_check(vk_control) and keyboard_check_pressed(vk_backspace)
    {
        keyboard_string = "";
    }
}

//Type
if typingEnemy
{
    enemyCurrentText = keyboard_string;
    
    //Clear
    if keyboard_check(vk_control) and keyboard_check_pressed(vk_backspace)
    {
        keyboard_string = "";
    }
}
