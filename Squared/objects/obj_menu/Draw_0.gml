/// @description Draw menus
		
/// Lobby menu
switch (state) {
	case STATE_LOBBY:
	    //set up drawing
	    draw_set_font(fnt_button);
	    draw_set_valign(fa_top);
	    draw_set_color(c_white);
    
	    var bh = 64;
	    var sw = 32;
    
	    // if online draw info from server
	    if (global.online) {
	        var attributes = 3; // attributes per player
	        var playerAmount = ds_list_size(serverData); // amount of players * attributes
	        // attribute order: team, ready, name, character
	        var bh = 32;
        
	        draw_set_halign(fa_left);
	        // loop through and draw each player
	        for (var i = 0; i < playerAmount; i += attributes) {
	            draw_rectangle(32, 32 + bh*i / attributes, room_width-32, 32+bh+bh*i / attributes, true);
	            draw_text(48+sw, 40 + bh*i / attributes, "Team " + string(ds_list_find_value(serverData, i)));
	            draw_text(128+sw, 40 + bh*i / attributes, "Ready: " + string(ds_list_find_value(serverData, i + 1)));
	            draw_text(240+sw, 40 + bh*i / attributes, "Name: " + string(ds_list_find_value(serverData, i + 2)));
	            //draw_sprite(spr_lobby, 0, 48, 46 + bh*i / attributes);
	            //draw_sprite(spr_lobby, 1, 426, 46 + bh*i / attributes);
	            }
        
	        // draw prompt
	        draw_set_halign(fa_center);
	        var controls = 0;
	        //var prompt = scr_getInputName(global.controls[controls, ACTION_KEY], ACTION_KEY, global.controls[controls, KEY_TYPE]);
	        //draw_text(room_width/2, room_height-80, "Press " + prompt + " to ready up!");
	        }
	    else {
	        // di - draw index
	        var di = 0;
        
	        draw_set_color(c_white)
	        // iterate through each local player
	        for (var i = 0; i < ds_list_size(players); i ++) {
	            draw_rectangle(32, 32 + bh*di, room_width-32, 32+bh+bh*i, true);
	            draw_set_halign(fa_left);
	            draw_text(48+sw, 40 + bh*di, "Team " + string(ds_list_find_value(teams, i)));
	            draw_text(128+sw, 40 + bh*di, "Ready: " + string(ds_list_find_value(readys, i)));
	            //draw_sprite(spr_lobby, 0, 48, 46 + bh*i);
	            //draw_sprite(spr_lobby, 1, 264, 46 + bh*i);
	            draw_set_halign(fa_center);
	            var controls = localControls[| i];
	            var prompt = scr_getInputName(global.controls[controls, ACTION_KEY], ACTION_KEY, global.controls[controls, KEY_TYPE]);
	            draw_text(room_width/2, 40 + bh*di+bh/2, "Press " + prompt + " to ready up!");
	            // increment draw index
	            di++
	            }
	        draw_set_color(c_gray)
	        // iterate throuch each non joined local player
	        for (var i = 0; i < controlsMax; i++) {
	            if (ds_list_find_index(localControls, i) == -1) {
	                // if player is not yet in print prompt.
	                draw_rectangle(32, 33 + bh*di, room_width-32, 33+bh+bh*di, true);
	                var controls = i;
	                var prompt = scr_getInputName(global.controls[controls, ACTION2_KEY], ACTION2_KEY, global.controls[controls, KEY_TYPE]);
	                draw_text(room_width/2, 40-16+ bh*di+bh/2, "Press " + prompt + " to ready up!");
	                // increment draw index
	                di++
	                }
	            }
	        }
		break;
	}
