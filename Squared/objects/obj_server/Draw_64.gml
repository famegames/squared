/// @description Draw server debug information
if (serverDebug)
{
    // setup drawing
    draw_set_color(c_dkgray);
    draw_set_alpha(0.5);
    
    // set draw offset
    var drawOffset = 0;
    var yOffset = 20;
    
    // once a frame, we send clients any priority message, if not in game
    var count = ds_list_size(ipList); // get the amount of clients connected
    
    // draw background
    draw_rectangle(0, 0, 500, count*2*yOffset+30+10, false);
    
    // setup drawing
    draw_set_halign(fa_left);
    draw_set_font(fnt_debug);
    draw_set_color(c_red);
    
    // draw the amount of players
    draw_text(10, 10, "players: "+string(playerTotal));
    
    // check for clients to send confirmations
    for (i = 0; i < count; i++)
	{ 
        //get the ip of the client to get the message
        var ip = ds_list_find_value(ipList, i);
        
        // find the type of message to send
        var message = ds_map_find_value(clientMessages, ip);
        
        // get the network player
        var inst = ds_map_find_value(Clients, ip);
        
        // get the latest sequence out
        var sequenceOut = sequenceOuts[| i];
        
        // draw RTT 
        draw_text(10, 30+yOffset*drawOffset, string(ip));
        draw_text(340, 30+yOffset*drawOffset, string(inst.currentRTT));
        draw_text(160, 30+yOffset*drawOffset, scr_networkStateToString(message));
        if (inst.alarm[0] < inst.dropBuffer-2)
            draw_text(400, 30+yOffset*drawOffset, string(inst.alarm[0]));
        
        // increment drawOffset
        drawOffset++;
        draw_text(10, 30+yOffset*drawOffset, "Socket Out: " + string(inst.socketOut));
        draw_text(120, 30+yOffset*drawOffset, "Message Success: " + string(inst.messageSuccess));
        draw_text(340, 30+yOffset*drawOffset, "Sequence Out: " + string(sequenceOut));
        // increment drawOffset
        drawOffset++;
    }
    
    // reset alpha
    draw_set_alpha(1);
}