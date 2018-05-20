/// @function scr_menuInitMain
/// @description initiate the main menu buttons

// create buttons
with (instance_create_layer(room_width/2, 176, "instances", obj_button))
{
	action = "local";
	title = "play";
	ds_list_add(other.buttons, id);
}
with (instance_create_layer(room_width/2, 176+48, "instances", obj_button))
{
	action = "online";
	// the title of the button does not be set, because it will be the same as the action
	ds_list_add(other.buttons, id);
}
with (instance_create_layer(room_width/2, room_height-64, "instances", obj_button))
{
	action = "quit";
	// the title of the button does not be set, because it will be the same as the action
	ds_list_add(other.buttons, id);
}