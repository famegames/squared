/// @description initialize network player

// Setup
// team
team = 0;
// ready - whether player is ready to move to next menu
ready = false;
// name - player name
name = "Player";
// gameCharacter - character in game
gameCharacter = noone;

// Networking
// connectIndex - the index where the player connected in the connection arrays
connectIndex = 0;
// currentRTT - store the current round trip time for messages
currentRTT = 0;
// ip - ip of client, used for disconnecting
ip = 0;
// dropBuffer - steps before a client is dropped, from not recieving a ping
dropBuffer = 60;

// mouse input
mouseX = 0;
mouseY = 0;

// Debug
// socketOut - the socket
socketOut = -1;
// messageSuccess - whether the message was succesful sent
messageSuccess = -1;

// login
alarm[1] = 2;