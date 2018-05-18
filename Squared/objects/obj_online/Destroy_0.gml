/// @description Close

// save online player information
scr_saveOnlinePlayer();

// destroy created instances
instance_destroy(directIp);
instance_destroy(playerName);

// cleanup will autmatically be called after