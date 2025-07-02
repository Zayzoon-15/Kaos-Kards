
//Card State
switch (state) {
	case CARDSTATE.HAND: cardStateHand(); break;
	case CARDSTATE.GRABBED: cardStateGrabbed(); break;
}

//Set Sprite
sprite_index = info.sprite;