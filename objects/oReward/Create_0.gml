//Set Position
x = ROOM_CENTER.x;
y = ROOM_CENTER.y;

//Set Menu
global.menuOpen = true;

//Create Button
instance_create_depth(ROOM_CENTER.x,SCREEN_HEIGHT - 100,depth-1,oRewardButton);

//Effect
effectPlayed = false;

//Create Cards
for (var i = 0; i < array_length(cards); i++) {
    
    var _x = cardHandMush(array_length(cards),i,ROOM_CENTER.x,sprite_width/2);
    
	instance_create_depth(_x,ROOM_CENTER.y,depth-2,oRewardCard,{
        info : cards[i],
        cardId : i
    });
}

//Give Cards To Player
global.playerFullDeck = array_concat(global.playerFullDeck,cards);