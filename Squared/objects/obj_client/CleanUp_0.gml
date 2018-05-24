/// @description Cleanup buffers and data structures

// destroy buffers
buffer_delete(buff);

// destroy network socket
network_destroy(client);

// clear server data
ds_list_clear(global.Menu.serverData);