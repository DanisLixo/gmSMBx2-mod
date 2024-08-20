var lvlbuff = buffer_create(32, buffer_grow, 1);
buffer_write(lvlbuff, buffer_u8, network.sync);
network_send_packet(client, lvlbuff, buffer_tell(lvlbuff));
buffer_delete(lvlbuff);