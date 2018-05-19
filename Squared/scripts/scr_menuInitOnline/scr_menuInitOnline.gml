/// @function scr_menuInitMain
/// @description initiate the main menu buttons

// create buttons

//reset selectedButton
selectedButton = 2; // start on host button

// temporarily freeze input
inputFreeze = inputFreezeMax;

// set room width and height manually, in case of changing from game
var rw = 1024;
var rh = 768;

// setup online menu
// back
with (instance_create_layer(96, rh-32, "instances", obj_button))
{
	action = "backMainOnline";
	title = "back";
	ds_list_add(other.buttons, self);
}
// join
with (instance_create_layer(room_width/2, rh - 32, "instances", obj_button))
{
	action = "directConnect";
	title = "direct";
	ds_list_add(other.buttons, self);
}
// host
with (instance_create_layer(rw - 96, rh - 32, "instances", obj_button))
{
	action = "createServer";
	title = "host";
	ds_list_add(other.buttons, self);
}
    
// create online object to handle everything
instance_create_layer(0, 0, "instances", obj_online);