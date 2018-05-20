/// @description Initialize server

// define macros
#macro SERVER_TYPE network_socket_udp

// set that game has the main server
global.mainServer = true;

// playerTotal - total amount of players

// create buffers
var alignment = 1;
broadcastBuffer = buffer_create(32, buffer_fixed, alignment);
gameBuffer = buffer_create(32, buffer_grow, alignment);//buffer_create(16384, buffer_fixed, alignment);

// create maps and lists
Clients = ds_map_create();
ipList = ds_list_create();
portList = ds_list_create();
sequenceOuts = ds_list_create();
sequenceOutQueues = ds_list_create();

// clientMessages - messages to the client, connection, login, game
clientMessages = ds_map_create();
// clientBuffer - buffer for small client messages
confirmBuffer = buffer_create(24, buffer_fixed, alignment);

// setup a timer so we can broadcast the server IP out to local clients looking...
alarm[0]=60;

// serverName - name of the server to broadcast
serverName = "";
// serverDebug - whether or not to draw server debug information
serverDebug = false;
// playerTotal - total amount of connected players
playerTotal = 0;

// try and create the actual server
// server creation may fail if there is already a server running
// if it does fail, delete eveything and kill this instance
server = network_create_server(SERVER_TYPE, 6510, 32 );
if (server < 0)
{    
    // if theres already a server running, shut down and delete
    instance_destroy();
}