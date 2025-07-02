

//Draw Cards
if cardsInPlay < global.maxHandSize and drawTime <= 0 and cardsLeft != 0
{
    drawCard();
} else drawTime --;


//Destroy Deck
if cardsLeft == 0
{
    visible = false;
}

//Tip Box
if visible then canHover = true; else canHover = false;

var _text;
if cardsLeft > 1
{
    _text = $"Your deck of cards\nYou have {cardsLeft} cards left";
} else _text = $"Your deck of cards\nYou have {cardsLeft} card left";
drawTipBox(_text);