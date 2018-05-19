///@description Cleanup server

// destroy server
global.haveserver = false;

// destroy server netowrk
network_destroy(server);

// destroy any client persistent objects
var count = ds_list_size(ipList); // get the amount of clients connected

// check for clients to send confirmations
for (i = 0; i < count; i++) { 
    //get the ip of the client to get the message
    var ip = ds_list_find_value(ipList, i);
    
    // get the network player
    var inst = ds_map_find_value(Clients, ip);
    
    // remove network player from lobby
    scr_joinLobby(inst);
    
    // destroy the persistent network player object
    instance_destroy(inst);
    
    // remove the player's specific sequenceOutQueue
    ds_map_destroy(sequenceOutQueues[| i]); 
    }

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