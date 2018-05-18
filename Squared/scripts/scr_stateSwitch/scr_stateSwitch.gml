/// @fucntion scr_stateSwitch
/// @description switches the current menu state to the new state
/// @argument form id of state to switch from
/// @argument to id of state to switch to

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
	case STATE_ONLINE:
        switch (to)
		{
            case STATE_LOBBY:
                // initiate lobby menu
                scr_menuInitLobby(from);
                break;
            case STATE_MAIN:
                // return to main menu
                with (obj_online) event_user(0);
					
                // initiate main menu
                scr_menuInitMain();
                break;
		}
}