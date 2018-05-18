/// @description Cleanup

// save online player information
scr_saveOninePlayer();

// destroy broadcast reciver network
network_destroy(recieverServer);

// destroy created instances
instance_destroy(directIp);
instance_destroy(playerName);