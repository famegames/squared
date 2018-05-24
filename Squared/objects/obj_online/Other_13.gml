/// @description Connect to a remote server

// switch menu to the lobby
scr_stateSwitch(STATE_ONLINE, STATE_LOBBY);
// create client
with (instance_create_layer(0, 0, "instances", obj_client))
{
	// tell client to connect to itself
	ip = other.connectIp;
		
	// set the player name
	playerName = other.playerName.text;
}
// client takes care of all networking now
instance_destroy();