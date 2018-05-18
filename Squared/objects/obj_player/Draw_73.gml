/// @description Draw the inventory

//draw spr_equipped
draw_sprite(spr_equipped,-1,0,room_height-64)
//Draw equipped sprites
if (instance_exists(inventory[0])) {
	draw_sprite(spr_itemDisplay,inventory[0].image_index,4,room_height-68);
	}
if (instance_exists(inventory[1])) {
	draw_sprite(spr_itemDisplay,inventory[1].image_index,72,room_height-68);
	}

//Draw inventory
if (inventoryOpen) {
	//Draw spr_inventory
	draw_sprite(spr_inventory,-1,(room_width/2)-(208/2),(room_height/2)-(208/2));
	//Draw items in inventory
	var arrayLength = array_length_1d(inventory);
	var rowSize = sqrt((arrayLength-2));
	for (i = 0; i < rowSize; i += 1) {
		for (j = 0; j < rowSize; j += 1) {
			if (instance_exists(inventory[i*3+j+2])) {
				draw_sprite(spr_itemDisplay,inventory[i*3+j+2].image_index,((room_width/2)-(208/2)+4*(j+1)+64*j),(room_height/2)-(208/2)+4*(i+1)+64*i);
				}
			}
		}
	}