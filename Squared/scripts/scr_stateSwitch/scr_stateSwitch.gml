/// @fucntion scr_stateSwitch
/// @description switches the current menu state to the new state
/// @argument form id of state to switch from
/// @argument to id of state to switch to

// set input
var from = argument0;
var to = argument1;

// clear previous menu
scr_menuClear();

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
}