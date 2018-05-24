/// @description Close server

// reset main server to false
global.mainServer = false;

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
	
// cleanup event will be automatically called to clean up the rest