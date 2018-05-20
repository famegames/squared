/// @description Draw client debug information
if (clientDebug) {
    // setup drawing
    draw_set_color(c_dkgray);
    draw_set_alpha(0.5);
    
    // set draw offset
    var drawOffset = 0;
    var yOffset = 20;
    var count = 9;
    
    // draw background
    draw_rectangle(0, 0, 500, count*yOffset+30+10, false);
    
    // setup drawing
    draw_set_halign(fa_left);
    draw_set_font(fnt_command);
    draw_set_color(c_red);
    
    // draw client informtion
    draw_text(10, 10, "CLIENT DEBUG");
    draw_text(10, 30+yOffset*drawOffset++, "Server Message Info:");
    draw_text(10, 30+yOffset*drawOffset++, "Socket In: " + string(socketIn));
    draw_text(10, 30+yOffset*drawOffset++, "Server IP: " + string(serverIP));
    draw_text(10, 30+yOffset*drawOffset++, "Sequence In: " + string(sequenceIn));
    draw_text(10, 30+yOffset*drawOffset++, "msgID In: " + scr_msgIDtoString(msgIDin));
    drawOffset++;// skip a space
    draw_text(10, 30+yOffset*drawOffset++, "Client State Info:");
    draw_text(10, 30+yOffset*drawOffset++, "Client Socket: " + string(client));
    draw_text(10, 30+yOffset*drawOffset++, "Network State: " + scr_networkStateToString(global.NetworkState));
    
    // reset alpha
    draw_set_alpha(1);
    }