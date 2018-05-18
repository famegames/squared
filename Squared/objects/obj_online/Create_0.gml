/// @description Setup to connect online

// define macros
#macro broadcastPort 6511
#macro gamePort 6510

// Server - the id of the server instance
global.Server = noone;
// mainServer - whether this game is the main server
global.mainServer = false;

// connectIp - the ip to connect to
connectIp = "127.0.0.1";

// serverList - list of all the discovered servers
serverList = ds_list_create();
// serverNames - names of all the discoverd servers
serverNames = ds_list_create();

// create the broadcast reciever server
recieverServer = network_create_server(network_socket_udp, broadcastPort, 100);

// setup menu
// create text boxes
directIp = instance_create_layer(154+32+64, room_height-32, "instances", obj_textBox);
playerName = instance_create_layer(room_width-(200+154+32+64), room_height-32, "instances", obj_textBox);

// attempt to load player
if (scr_loadOnlinePlayer() == false)
{
	// set defaults
	directIp = "127.0.0.1";
	playerName = "Newbius";
}

// online - whether the game is online
global.online = true;