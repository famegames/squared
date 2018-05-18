/// @description Equip item to left

//Equip a weapon or apply an upgrade
if (inventoryOpen) {
	var arrayLength = array_length_1d(inventory);
	var rowSize = sqrt((arrayLength-2));
	for (i = 0; i < rowSize; i += 1) {
		for (j = 0; j < rowSize; j += 1) {
			currentIndex = i*3+j+2;
			if (instance_exists(inventory[currentIndex])) {
				if ((mouse_x >= ((room_width/2)-(208/2)+4*(j+1)+64*j)) and (mouse_x <= (((room_width/2)-(208/2)+4*(j+1)+64*j)) + 64)) {
					if ((mouse_y >= ((room_height/2)-(208/2)+4*(i+1)+64*i)) and (mouse_y <= ((room_height/2)-(208/2)+4*(i+1)+64*i) + 64)) {
						if (object_is_ancestor(inventory[currentIndex].object_index,par_upgrade)) {
							if (object_is_ancestor(inventory[0].object_index,par_toolModular)) {
								with (inventory[0]) {
									dmg += other.inventory[other.currentIndex].dmg;
									fireRate += other.inventory[other.currentIndex].fireRate;
									range += other.inventory[other.currentIndex].range;
									instance_destroy(other.inventory[other.currentIndex]);
									}
								}
							}
						else {
							var tempId = inventory[currentIndex];
							inventory[currentIndex] = inventory[0];
							inventory[0] = tempId;
							}
						}
					}
				}
			}
		}
	}


