/// @fucntion scr_saveOnlinePlayer
/// @description save the online player details

//open file
ini_open("onlinePlayer.ini");
    
//save data
section = "menu";
ini_section_delete(section);
ini_write_string(section, "directIp", directIp.text);
ini_write_string(section, "name", playerName.text);
    
//close file
ini_close(); 