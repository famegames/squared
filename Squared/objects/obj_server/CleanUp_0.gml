///@description Cleanup server

// destroy server
global.haveserver = false;

// destroy server netowrk
network_destroy(server);

// delete buffers
buffer_delete(broadcastBuffer);
buffer_delete(gameBuffer);
buffer_delete(confirmBuffer);
// destroy lists
ds_list_destroy(ipList);
ds_list_destroy(portList);
ds_list_destroy(sequenceOuts);
ds_list_destroy(sequenceOutQueues);
// destroy maps
ds_map_destroy(Clients);
ds_map_destroy(clientMessages);
ds_list_destroy(sequenceOutQueues);