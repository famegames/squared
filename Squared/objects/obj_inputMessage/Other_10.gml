/// @description Do action
switch(actions[| actionSel]) {
    case "backOnlineLobby":
        // return to online menu from the lobby
        scr_stateSwitch(STATE_LOBBY, STATE_ONLINE);
        break;
    case "backOnlineGame":
        // return to online menu from the lobby
        scr_stateSwitch(STATE_GAME, STATE_ONLINE);
        break;
    case "backOnlineScore":
        // return to online menu from the lobby
        scr_stateSwitch(STATE_SCORE, STATE_ONLINE);
        break;
    case "restart":
        game_restart();
        break;
    case "quit":
        game_end();
        break;
    }