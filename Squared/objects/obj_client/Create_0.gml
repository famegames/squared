/// @description Initialize client

// define macros
#macro NETWORK_CONNECT 0
#macro NETWORK_LOGIN 1
#macro NETWORK_PLAY 2

// playerName - name of the player
playerName = "";   //get the name that was selected (it's a server OR player name)

// ip - server IP
ip = "";
// port - server port
port = GAME_PORT;

// disconnectBuffer - buffer before asking to disconnect
disconnectBuffer = 60;

// create a buffer for the network messages
var alignment = 1;
buff = buffer_create(256, buffer_grow, alignment);

// create a UDP socket
// remember this socket ID so the server can ignore it (if we have a local server)
client = network_create_socket(SERVER_TYPE);

// remember client id
global.Client = self;

// attempt to connect to server
networkState = NETWORK_CONNECT;
connectBuffer = 30; // give client one secound to connect

// realiabilty, ordering, and congestion avoidance for UDP
sequenceIn = -1; // stores latest packet sequence that the client has recieved

/// debug
// clientDebug - whether to show debug for the client
clientDebug = false;
// msgIDin - the latest server message ID
msgIDin = 0;
// socketIn - the socket id coming in from the server
socketIn = -1;
// serverIP - IP address of where message are coming in from
serverIP = -1;