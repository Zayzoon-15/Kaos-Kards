///This is an alert system made to visually show changes to the game
//So a kind of visual print for the player

//Create Alert Array That Holds All Alerts
if !variable_global_exists("_alertBox") {
    variable_global_set("_alertBox", [self.id]);
} else { 
    array_push(variable_global_get("_alertBox"), self.id);
}
alertId = array_length(variable_global_get("_alertBox"));

//Get Duplicate Number
extraNum = 0;
for (var i = 0; i < array_length(variable_global_get("_alertBox")); i++) {
	var _array = variable_global_get("_alertBox");
    if instance_exists(_array[i]) and _array[i].alertTitle == alertTitle and _array[i].alertText == alertText {
        extraNum ++;
    }
}

//Box Size
margin = new Vector2(10, 10);
width = 200;
height = 50;

//Set Starting Position
x = -100;
y = room_height

//Set Alpha
image_alpha = 0;