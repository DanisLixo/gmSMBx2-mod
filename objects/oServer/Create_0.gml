/// @description Initialize Server

//Server Variables
port = global.port
max_players = global.maxplayers


server = network_create_server_raw(network_socket_tcp, port, max_players);
//server = network_create_server(network_socket_tcp, port, max_players);
total_players = ds_list_create();

//create a map to keep track of clients
server_instances = ds_map_create();

//Display error if server is unable to be created
if (server < 0) {
	show_message("could not create server");
	game_restart();
}




choosingmode = false;
cmsel = 0;
cmoptions = ds_list_create()
cmbool = ds_list_create()


ds_list_add(cmoptions,"Race")
ds_list_add(cmoptions,"Guns")
ds_list_add(cmoptions,"Dark mode")
ds_list_add(cmoptions,"Commander")
ds_list_add(cmoptions,"Arena")
ds_list_add(cmoptions,"Challenge")
ds_list_add(cmoptions,"Begin on extra")
ds_list_add(cmoptions,"Players collide")


ds_list_add(cmbool,"race")
ds_list_add(cmbool,"schutmode")
ds_list_add(cmbool,"rtxmode")
ds_list_add(cmbool,"commandenys")
ds_list_add(cmbool,"arena")
ds_list_add(cmbool,"challenge")
ds_list_add(cmbool,"extra")
ds_list_add(cmbool,"playercol")

ds_list_add(cmoptions,"Begin game")	ds_list_add(cmbool,-1)
ds_list_add(cmoptions,"Disconnect")	ds_list_add(cmbool,-1)

