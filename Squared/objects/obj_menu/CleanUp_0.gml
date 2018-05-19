/// @description Cleanup lists and maps

// destory lists
ds_list_destroy(buttons);
ds_list_destroy(players);
ds_list_destroy(teams);
ds_list_destroy(names);
ds_list_destroy(readys);
ds_list_destroy(localControls);

// destroy maps
ds_map_destroy(localPlayers);