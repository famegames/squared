/// @function scr_serverRecievedData
/// @description read incoming client data

//start
    {  
    // get the buffer the data resides in
    var buff = ds_map_find_value(async_load, "buffer");

    // read the command, msgId was already read in obj_server
    var cmd = buffer_read(buff, buffer_u8 );

    // Get the socket ID - this is the CLIENT socket ID. We can use this as a "key" for this client
    var ip = ds_map_find_value(async_load, "ip");

    // Look up the client details
    var inst = ds_map_find_value(Clients, ip);

    // continue if networkPlayer is already created
    if !(is_undefined(inst)) {
        // handle depending on command
        switch (cmd) {
			case INPUT_CMD:
				// read the control that was sent
				var control = buffer_read(buff, buffer_u8);
		        // and it's up/down state
		        var state = buffer_read(buff, buffer_u8);
				
				// set its state
				inst.inputs[control] = state;
				break;
            case PING_CMD:
                // client message, confirm login
                ds_map_replace(clientMessages, ip, SERVER_PLAY);  
                
                // read the latest sequence that the client recieved
                var sequenceIn = buffer_read(buff, buffer_u8);
                
                // get the index
                var index = ds_list_find_index(ipList, ip);
                
                // check if sequence is still in the queue
                if (ds_map_exists(sequenceOutQueues[| index], sequenceIn)) { 
                    //get time passed between sending and recieving back
                    var packetRTT = current_time - ds_map_find_value(sequenceOutQueue, sequenceIn);
                    var RTTChange = inst.currentRTT - packetRTT;
                    inst.currentRTT -= (RTTChange*.1); //adjust only by 10% to smooth out
                    }
                    
                // reset drop buffer
                inst.alarm[0] = inst.dropBuffer;
                break;
            }
        }
    }