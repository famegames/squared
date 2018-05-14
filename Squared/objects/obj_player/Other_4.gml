/// @description Create character

// create an obj_character at the bottom left
with (instance_create_layer(32, room_height-32*2, "instances", obj_character)) {
	//Set controlling player
	Player = other;
	}