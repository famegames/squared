/// @description Button click

// carry out button action
switch (action)
{
	case "local":
		// local game
		room_goto(room0);
		break;
	case "online":
		// online game
		with (global.Menu) scr_stateSwitch(STATE_MAIN, STATE_ONLINE);
		break;
	case "backMainOnline":
        // return to main menu from the online menu
        with (global.Menu) scr_stateSwitch(STATE_ONLINE, STATE_MAIN);
        break;
	case "quit":
		// quit game
		game_end();
		break;
	default:
		// do nothing
}