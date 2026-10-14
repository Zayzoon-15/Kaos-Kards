///@desc Play Rolling Sound

//Stop Loop
if diceId == 3 and state != DICE_STATES.ROLLING  {
    exit;
}

//Play Sound
audioPlaySfx(snDiceRoll);

//Repeat Sound
d_alarm[3] = 15;