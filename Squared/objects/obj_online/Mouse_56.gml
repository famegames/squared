/// @description Detect clicking on server list

var yindex = 40+30;
var count = ds_list_size(serverList);
if( mouse_y>70 && mouse_y<(70+(count*30)) ){
    var picked = floor(((mouse_y-70)/30) );
    connectIp = ds_list_find_value(serverList, picked );
    event_user(3)
}

