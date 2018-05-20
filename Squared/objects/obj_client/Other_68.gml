/// @description Networking code
var eventid = ds_map_find_value(async_load, "id");
socketIn = eventid; // the socket id coming from the server
serverIP = ds_map_find_value(async_load, "ip");

//show_debug_message(string(eventid));
//is this message for our socket?
if(client == eventid) {
    // if in a state that needs a confirmation
    if (networkState == NETWORK_CONNECT || networkState == NETWORK_LOGIN) {
        // read buffer data
        var buffer = ds_map_find_value(async_load, "buffer");
        
        // find start since the connection is UDP and not sorted out for us
        buffer_seek(buffer, buffer_seek_start,0);
        
        // read msgId, confirmation message, or game message
        var msgId = buffer_read(buffer, buffer_s8);
        
        // set msgIDin for debug purposes
        msgIDin = msgId;
        
        // read sequence
        var sequence = buffer_read(buffer, buffer_u8);
        
        // if more recent message, check
        if (scr_sequenceMoreRecent(sequence, sequenceIn, SEQUENCE_MAX)) { //this package is newer and therefore requires an update, 65,535 is for buffer_u16
            // update sequenceIn
            sequenceIn = sequence;
            
            // update disconnect buffer
            alarm[0] = disconnectBuffer;
            
            // check if server is confirming a connection
            if (networkState == NETWORK_CONNECT && msgId == SERVER_CONNECT) {
                // connection confirmed! move to login state
                networkState = NETWORK_LOGIN;
                }
            // check if server is confirming a login
            if (networkState == NETWORK_LOGIN && msgId == SERVER_LOGIN) {
                // connection confirmed! move to login state
                networkState = NETWORK_PLAY;
                }
            // game check is handled later
            }
        }
    }
//show_debug_message(string("next"));