global.menuOpen = false;

//Destroy Items
instance_destroy(oRewardButton);
instance_destroy(oRewardCard);
for (var i = 0; i < array_length(extra); i++) {
	instance_destroy(extra[i]);
}