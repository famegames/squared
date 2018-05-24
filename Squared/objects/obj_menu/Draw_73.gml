/// @description Draw selector
    if (ds_list_size(buttons) > 0) {
        var button = ds_list_find_value(buttons, selectedButton);
        if !(is_undefined(button)) {
	        if (instance_exists(button)) {
	            // draw selector on the other side
	            draw_sprite_ext(spr_selector, -1, button.x, button.y, 1, 1, 180, c_white, 1);
	            }
	        }
		}