//Enemy Shake On Click
if point_in_rectangle(mouse_x,mouse_y,enemyX - sprite_width/2,enemyY - sprite_height/2,enemyX + sprite_width/2,enemyY + sprite_height/2) and mouse_check_button_pressed(mb_left)
{
    enemyShake += 5;
    audioPlaySfx(snShake,2.2,2.5);
}
