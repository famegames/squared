/// @description Broadcast our location occasionally
// clients pick this up and can then display servers to the user

// write ip message
buffer_seek(broadcastBuffer, buffer_seek_start, 0);
buffer_write(broadcastBuffer, buffer_string, serverName);

// send message
network_send_broadcast(server, 6511, broadcastBuffer, buffer_tell(broadcastBuffer));

// broadcast once a second...
alarm[0] = 60;
