/// @description Create character

// create an obj_character at the bottom left
with (instance_create_layer(48, room_height-32*3+16, "instances", obj_character)) {
	//Set controlling player
	Player = other;
	}