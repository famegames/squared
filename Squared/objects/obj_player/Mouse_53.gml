/// @description Equip item to left

//Equip a weapon or apply an upgrade
if (inventoryOpen) {
	var arrayLength = array_length_1d(inventory);
	var rowSize = sqrt((arrayLength-2));
	for (i = 0; i < rowSize; i += 1) {
		for (j = 0; j < rowSize; j += 1) {
			if (instance_exists(inventory[i*3+j+2])) {
				if ((mouse_x >= ((room_width/2)-(208/2)+4*(j+1)+64*j)) and (mouse_x <= (((room_width/2)-(208/2)+4*(j+1)+64*j)) + 64)) {
					if ((mouse_y >= ((room_height/2)-(208/2)+4*(i+1)+64*i)) and (mouse_y <= ((room_height/2)-(208/2)+4*(i+1)+64*i) + 64)) {
						if (object_is_ancestor(inventory[i*3+j+2],par_upgrade)) {
							if (object_is_ancestor(inventory[0],par_toolModular)) {
								with (inventory[0]) {
									dmg += inventory[i*3+j+2].dmg;
									fireRate += inventory[i*3+j+2].fireRate;
									range += inventory[i*3+j+2].range;
									instance_destroy(inventory[i*3+j+2]);
									}
								}
							}
						var tempId = inventory[i*3+j+2];
						inventory[i*3+j+2] = inventory[0];
						inventory[0] = tempId;
						}
					}
				}
			}
		}
	}


