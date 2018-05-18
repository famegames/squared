/// @description Return to main

// go offline
global.online = false;

// destroy ds_lists
ds_list_destroy(serverList);
ds_list_destroy(serverNames);

// destroy self
instance_destroy();