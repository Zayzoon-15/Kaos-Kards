
//Card State
switch (state) {
	case CARDSTATE.HAND: cardStateHand(); break;
	case CARDSTATE.GRABBED: cardStateGrabbed(); break;
    case CARDSTATE.PLACED: cardStatePlaced(); break;
}

//Set Sprite
sprite_index = info.sprite;