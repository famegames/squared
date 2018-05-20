/// @description Host game

// create server
global.Server = instance_create_layer(0, 0, "instances", obj_server);
// set the server name
global.Server.serverName = playerName.text;

// check if succesful
if !(global.mainServer)
    show_debug_message("Cant create server");
else
{
    // switch menu to the lobby
    scr_stateSwitch(STATE_ONLINE, STATE_LOBBY);
    
    // create client
    with (instance_create_layer(0, 0, "instances", obj_client))
	{
		// tell client to connect to itself
		ip = "127.0.0.1";
		
		// set the player name
		playerName = other.playerName.text;
	}
	
    // client takes care of all networking now
    instance_destroy(obj_online);
}