//Get Colliding Card
var _card = collision_circle(x, y, 80, oCardPrepare, false, true);

//Card Touching
if _card and _card.grabbed and array_contains_value(types, _card.info.type) {
	//Set Scale
	targetScale = 1.15;
		
	//Look Towards Card
	if !filled {
		//Get Distance To Card
		var _distance = distance_to_point(_card.x, _card.y)/20;
		_distance = clamp(_distance, -30, 30);
	
		//Move Towards Card
		var _dir = point_direction(x, y, _card.x, _card.y);
		slotOffsetTargetX = lengthdir_x(_distance, _dir);
		slotOffsetTargetY = lengthdir_y(_distance, _dir);
	}
} else {
	//Reset Image
	targetScale = 1;
	slotOffsetTargetX = 0;
	slotOffsetTargetY = 0;
}

//Slot Filled
if filled {
	
	//Set Size
	targetScale = 1.3;
	
	//Card Not Placed
	if instance_exists(card) and (card.slot == noone or card.slot.id != self.id) {
		card = noone;
		filled = false;
	}
	
}


//Ease Values
scaleX = lerp_dt(scaleX, targetScale, .2);
scaleY = lerp_dt(scaleY, targetScale, .2);
slotOffsetX = lerp_dt(slotOffsetX, slotOffsetTargetX, .2);
slotOffsetY = lerp_dt(slotOffsetY, slotOffsetTargetY, .2);