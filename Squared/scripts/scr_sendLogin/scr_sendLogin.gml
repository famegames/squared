/// @function scr_sendLogin
/// @description logins the client, send its name
/// @argument name - name to send

// set input
var name = argument0;

// Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
buffer_seek(buff, buffer_seek_start, 0);

//write msgId
buffer_write(buff, buffer_s8, CLIENT_LOGIN);
// Write the name into the buffer.
buffer_write(buff, buffer_string, name);

// Send this to the server
network_send_udp(client, ip, port, buff, buffer_tell(buff));
