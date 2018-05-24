/// @description Tick

// Client messages
// once a frame, we send clients any priority message, if not in game
var count = ds_list_size(ipList); // get the amount of clients connected

// if there is at least one client, continue
if (count > 0) {
// send appropiate game data
switch(global.Menu.state) {
    case STATE_LOBBY:
        // write the lobby information to the sending buffer
        scr_writeLobby();
                
        // check for clients to send confirmations
        for (var i = 0; i < count; i++) { 
            //get the ip of the client to get the message
            var ip = ds_list_find_value(ipList, i);
                    
            // find the type of message to send
            var message = ds_map_find_value(clientMessages, ip);
                    
            // check if need to send a confirmation
            if (message != SERVER_PLAY) {
                // send neccesary confirmation
                        
                // get the client message buffer
                var buff = confirmBuffer;
                        
                // reset buffer to start - Networking ALWAYS reads from the START of the buffer
                buffer_seek(buff, buffer_seek_start, 0);
                        
                // write msgId
                buffer_write(buff, buffer_s8, message);
                        
                // write packet sequence
                buffer_write(buff, buffer_u8, 0);//sequenceOut); Written in send buffer
                        
                // send confirmation to the client
                scr_sendBuffer(ip, i, buff);
                }
            else {
                // send pre_written lobby data
                scr_sendBuffer(ip, i, gameBuffer);
                }
            }
        break;
    }
}