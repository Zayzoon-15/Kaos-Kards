///@desc Remove Hands

//Leave
var _x = handId == 0 ? -sprite_width : room_width + sprite_get_width(sprite_index);
TweenEasyScale(image_xscale,1,0,1,0,40,EaseInBack);
TweenEasyFade(1,0,0,40,EaseInBack);

//Destroy
timeSourceCreate(40,function(){instance_destroy();},[],time_source_units_frames);

//Is Draw
if outcome == "Draw" and handId == 0
{
	timeSourceCreate(.7,function(){
		//Create Text
		instance_create_layer(0,0,"Attacks",oRpsText);
	
		//Create Choices
		var _offset = sprite_get_width(sRpsChoice) * 2;
		for (var i = 0; i < 3; ++i) {	
		    instance_create_layer(ROOM_CENTER.x + (_offset*(i-1)),ROOM_CENTER.y,"Attacks",oRpsChoice,{
				choiceId : i
			});
		}
	});
}