
if typing
{
    if !variable_struct_exists(anim.animInfo,currentText)
    {
        show_message($"'{currentText}' Does Not Exist");
    }
    
    anim.play(currentText);
} else if typingEnemy
{
    
    if !variable_struct_exists(enemyInfo,enemyCurrentText)
    {
        show_message($"'{enemyCurrentText}' Does Not Exist");
    }
    
    info = struct_get(enemyInfo,enemyCurrentText);
    anim = new animManager(info);
    anim.play("idle");
    
}

typing = false;
typingEnemy = false;