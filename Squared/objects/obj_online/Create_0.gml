/// @description Setup to connect online

// define macros
#macro BROADCAST_PORT 6511
#macro GAME_PORT 6510

// Server - the id of the server instance
global.Server = noone;
// mainServer - whether this game is the main server
global.mainServer = false;
// OnlineObject - online tracking object, this
global.OnlineObject = id;

// connectIp - the ip to connect to
connectIp = "127.0.0.1";

// serverList - list of all the discovered servers
serverList = ds_list_create();
// serverNames - names of all the discoverd servers
serverNames = ds_list_create();

// create the broadcast reciever server
recieverServer = network_create_server(network_socket_udp, BROADCAST_PORT, 100);

// setup menu
// create text boxes
directIp = instance_create_layer(room_width/2-196, room_height-32, "instances", obj_textBox);
directIp.title = "Direct IP: ";
playerName = instance_create_layer(room_width-(200+32+64), room_height-32, "instances", obj_textBox);
playerName.title = "Name: ";

// attempt to load player
if (scr_loadOnlinePlayer() == false)
{
	// set defaults
	directIp.text = "127.0.0.1";
	playerName.text = "Newbius";
}

// online - whether the game is online
global.online = true;