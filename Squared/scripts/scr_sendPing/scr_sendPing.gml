/// @function scr_sendPing
/// @description sends ping message

// Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
buffer_seek(buff, buffer_seek_start, 0);

//write msgId -1 - disconnect, 0 - game, 1 - connect
buffer_write(buff, buffer_s8, CLIENT_PLAY);
//write the command into the buffer.
buffer_write(buff, buffer_u8, PING_CMD );
    
// send the most recent sequence for RTT, round trip time, checking
buffer_write(buff, buffer_u8, sequenceIn);

// Send this to the server
network_send_udp(client,ip,port,buff,buffer_tell(buff));