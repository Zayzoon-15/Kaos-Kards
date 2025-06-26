
switch (state) {
	
    case CARDSTATE.HAND:
        event_user(0);
    break;
    
    case CARDSTATE.GRABBED:
        event_user(1);
    break;
    
    case CARDSTATE.PLACED:
        event_user(2);
    break;
    
}
