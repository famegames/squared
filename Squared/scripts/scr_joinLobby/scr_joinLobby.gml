/// @function scr_joinLobby
/// @description joins or drops a client from the lobby
/// @argument client client instance id

with (global.Menu) {
    // set input
    var connectIndex = argument0.connectIndex;
    var name = argument0.name;

    var index = ds_list_find_index(players, connectIndex)
    if (index >= 0) {
        ds_list_delete(players, index);
        ds_list_delete(teams, index);
        ds_list_delete(names, index);
        ds_list_delete(localControls, index); // local only
        ds_list_delete(readys, index);
        }
    else {
        ds_list_add(players, connectIndex);
        ds_list_add(teams, 0);
        ds_list_add(names, name);
        ds_list_add(localControls, 0); // local only, set after joining
        ds_list_add(readys, false);
        }
    }