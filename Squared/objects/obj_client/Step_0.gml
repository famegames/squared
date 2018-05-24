/// @description Nnetwork control
switch(networkState)
{
    case(NETWORK_CONNECT): //attempt to connect to server
        if (connectBuffer > 0)
		{
            //move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
            buffer_seek(buff, buffer_seek_start, 0);
    
            //write msgId
            buffer_write(buff, buffer_s8, CLIENT_CONNECT);
    
            // Send this to the server
            var message = network_send_udp(client,ip,port,buff,buffer_tell(buff));
            if (message <= 0) { //network_send_udp returns number less than one if message fails
                if !(instance_exists(obj_inputMessage)) {
                //if we can't connect, show and error and restart... could be more graceful :)
                with (instance_create_layer(room_width/2, room_height/2, "instances", obj_inputMessage)) {
                    prompt = "ERROR: Can not connect to server";
                    ds_list_add(actions, "backOnlineLobby");
                    ds_list_add(actionTitles, "Back");
                    }
                    }
                }
            
            //lower connect buffer
            connectBuffer --;
        }
        else {
            // time for connect ran out
            if !(instance_exists(obj_inputMessage)) {
            with (instance_create_layer(room_width/2, room_height/2, "instances", obj_inputMessage)) {
                prompt = "ERROR: Connection time ran out";
                ds_list_add(actions, "backOnlineLobby");
                ds_list_add(actionTitles, "Back");
                }
                }
            }
        break;
    case(NETWORK_LOGIN): //login 
        //client has connected to the server, so send our "player name"
        scr_sendLogin(playerName);
        break;
    case(NETWORK_PLAY): //game is running
        scr_sendPing();
        break;
    }

/// Send input
var controls = 0;
var amount = array_length_2d(global.controls, controls);

// send input according to type
switch (global.controls[controls, KEY_TYPE]) {
    case CONTROLS_KEYBOARD:
        for (var i = 0; i < amount-1; i++;) {
            // input the input state
            var input = scr_getKeyInput(global.controls[controls, i]);
            if (input == KEY_PRESSED || input == KEY_RELEASED)
				scr_sendInput(i, input);
            }
        break;
    case CONTROLS_MOUSE:
        for (var i = 0; i < amount-3; i++;) {
            // input the input state
            var input = scr_getKeyInput(global.controls[controls, i]);
            if (input == KEY_PRESSED || input == KEY_RELEASED)
				scr_sendInput(i, input);
            }
        for (var i = amount-3; i < amount-1; i++;) {
            // input the input state
            var input = scr_getMouseInput(global.controls[controls, i]);
            if (input == KEY_PRESSED || input == KEY_RELEASED)
				scr_sendInput(i, input);
            }
        break;
    default:
        // joystick input
    }