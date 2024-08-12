/// @description Initialize Server

savedw = SCREENW
savedh = SCREENH

SCREENW = SCREENW_WS
SCREENH = SCREENH_UW
			
camera_set_view_size(view_camera[0], SCREENW, SCREENH)
surface_resize(application_surface,SCREENW,SCREENH)
var scrsizemult = 3;
window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);

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



changemode = -1;
c = 0
choosingmode = false;
cmsel = 0;
cmsec = 0;
cmoptions = ds_grid_create(2,8)
cmbool = ds_grid_create(2,8)

addcm = function(sec,pos,label,isforbool)
{
	if isforbool {cmbool[# sec,pos] = label}
	else {cmoptions[# sec,pos] = label}
}

ga = 0
glev = 1
gwor = 1
secs = 10

addcm(0,0,"Race", false)
addcm(0,1,"Time to wait for others - ", false)
addcm(0,2,"Guns", false)
addcm(0,3,"Dark mode", false)
addcm(0,4,"Commander", false)
addcm(0,5,"Arena NOT WORKING - ", false)
addcm(0,6,"Challenge", false)
addcm(0,7,"", false)
addcm(1,0,"Wait others to advance", false)
addcm(1,1,"Begin on extra", false)
addcm(1,2,"Players collide", false)
addcm(1,3,"Characters abilities", false)
addcm(1,4,"World - ", false)
addcm(1,5,"Level - ", false)


addcm(0,0,"race", true)
addcm(0,1,"nextlvltimer", true)
addcm(0,2,"schutmode", true)
addcm(0,3,"rtxmode", true)
addcm(0,4,"commandenys", true)
addcm(0,5,"arena", true)
addcm(0,6,"challenge", true)
addcm(1,0,"waiting", true)
addcm(1,1,"extra", true)
addcm(1,2,"playercol", true)
addcm(1,3,"abilities", true)
addcm(1,4,"world", true)
addcm(1,5,"level", true)

addcm(1,6,"Begin game", false)	addcm(1,6,-1, true)
addcm(1,7,"Disconnect", false)	addcm(1,7,-1, true)

