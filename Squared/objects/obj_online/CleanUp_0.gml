/// @description Cleanup

// destroy broadcast reciver network
network_destroy(recieverServer);

// destroy lists
ds_list_destroy(serverList);
ds_list_destroy(serverNames);