/// @function scr_menuInitLobby
/// @description initiate the lobby menu
/// @argument from which state is the transition from

// set input
var from = argument0;

// set state
state = STATE_LOBBY;

// reset selected
selected = 0;

// back
var button = instance_create_layer(96, room_height-32, "instances", obj_button);
if (previous == STATE_ONLINE) 
    button.action = "backOnlineLobby";
else
    button.action = "backMainLobby";
button.title = "back";
ds_list_add(buttons, button);