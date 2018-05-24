/// @description Drop an item

if (inventoryOpen) {
	var arrayLength = array_length_1d(inventory);
	var rowSize = sqrt((arrayLength-2));
	for (i = 0; i < rowSize; i += 1) {
		for (j = 0; j < rowSize; j += 1) {
			if (instance_exists(inventory[i*3+j+2])) {
				if ((mouse_x >= ((room_width/2)-(208/2)+4*(j+1)+64*j)) and (mouse_x <= (((room_width/2)-(208/2)+4*(j+1)+64*j)) + 64)) {
					if ((mouse_y >= ((room_height/2)-(208/2)+4*(i+1)+64*i)) and (mouse_y <= ((room_height/2)-(208/2)+4*(i+1)+64*i) + 64)) {
						inventory[i*3+j+2].x = obj_character.x;
						inventory[i*3+j+2].y = obj_character.y;
						inventory[i*3+j+2].visible = true;
						inventory[i*3+j+2] = noone;
						}
					}
				}
			}
		}
	}
