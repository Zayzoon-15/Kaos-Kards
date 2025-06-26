if cardsPicked != totalCards and currentCards != maxHandSize and cardsInPlay != maxHandSize and startingCards >= maxHandSize and gamestate == GAMESTATE.PREPARE
{
    givePlayerCards();
} else 
{
    audio_play_sound(snDeny,0,false);
    shake = 5;
}