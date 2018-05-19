/// @function scr_networkStateToString
/// @description returns string name of the macro
/// @argument state the network stae

// set input
var state = argument0;

// check state, and draw constant name accordingly
switch (state) {
    case SERVER_CONNECT:
        return("SERVER_CONNECT");
    case SERVER_LOGIN:
        return("SERVER_LOGIN");
    case SERVER_PLAY:
        return("SERVER_PLAY");
    default:
        return("ERROR: INCORRECT STATE");
    }