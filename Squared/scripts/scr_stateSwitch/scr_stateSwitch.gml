/// @fucntion scr_stateSwitch
/// @description switches the current menu state to the new state
/// @argument form id of state to switch from
/// @argument to id of state to switch to


with (global.Menu)
{
	// set input
	var from = argument0;
	var to = argument1;

	// clear previous menu
	scr_menuClear();
	
	// set state
	state = to;

	// switch menu state
	switch (from)
	{
	    case STATE_MAIN:
	        switch (to)
			{
	            case STATE_ONLINE:
					// initiate online menu
					scr_menuInitOnline();
					break;
			}
			break;
		case STATE_ONLINE:
	        switch (to)
			{
	            case STATE_LOBBY:
	                // initiate lobby menu
	                scr_menuInitLobby(from);
	                break;
	            case STATE_MAIN:
	                // return to main menu
	                with (global.OnlineObject) event_user(0);
					
	                // initiate main menu
	                scr_menuInitMain();
	                break;
			}
			break;
		case STATE_LOBBY:
            switch (to) {
                case STATE_MAIN:
                    // drop players
                    with (obj_menu) event_user(0);
                    
                    // initiate main menu
                    scr_menuInitMain();
                    break;
                case STATE_ONLINE:
                    // destroy online objects
                    if (global.mainServer) // check if hosting
                        instance_destroy(obj_server);
                    instance_destroy(obj_client);
                    
                    // initiate online menu
                    scr_menuInitOnline();
                    break;
                }
            break;
	}
}