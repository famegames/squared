/// @fucntion scr_loadOnlinePlayer
/// @description load the saved online player if exists

// success - whether the player exists
var success = false

if (file_exists("onlinePlayer.ini"))
{
	// open file
    ini_open("onlinePlayer.ini");
    
	var section = "menu";
	// load directIP
	directIp.text = ini_read_string(section, "directIp", "127.0.0.1");
    // load name
    playerName.text = ini_read_string(section, "name", "Newbius");
	
	// set success
	success = true;
    
    //close file
    ini_close();
}
	
// return success
return success;