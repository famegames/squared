/// @function scr_sendInput()
/// @description Send a key "event" to the server
/// @argument input input constant
/// @argument state input state

// set input
var input = argument0;
var state = argument1;

//start
    {
    // Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
    buffer_seek(buff, buffer_seek_start, 0);

    //write msgId -1 - disconnect, 0 - game, 1 - connect
    buffer_write(buff, buffer_s8, 0 );
    // Write the command, the key and the UP/DOWN state into the buffer
    buffer_write(buff, buffer_u8, INPUT_CMD);
    buffer_write(buff, buffer_u8, input);
    buffer_write(buff, buffer_u8, state);

    // Send this to the server
    network_send_udp(client,ip,port,buff,buffer_tell(buff));
    }