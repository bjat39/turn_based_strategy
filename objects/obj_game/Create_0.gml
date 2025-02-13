/// @description 
#macro GRID_SIZE 16

game_state = "initialising"; //initialising, player, ai1,ai2 //turn state machine
player_state = "cursor_explore"; //cursor_explore, cursor_selected, cursor_menu (explore = cursor freely move, selected = cursor move within range, menu cursor can't move (still recieving inputs)(attack anims))

ai_state = "initialise";//"not_turn";
//aleneti_state = "not_turn"; //not_turn, initialise (sort units? do this after every move?), move units
//ally_state = "not_turn";
//strucia_state = "not_turn";
//select = obj_cursor exists, action_command = obj_cursor does not exist

sfx_gain = 1;

up_key = vk_up;
down_key = vk_down;

up_input = keyboard_check_pressed(up_key); //for menus
down_input = keyboard_check_pressed(down_key);

vert_input = scr_vert_input(); //for cursor explore
hori_input = scr_hori_input();

accept_input = keyboard_check_pressed(ord("Z"));
return_input = keyboard_check_pressed(ord("X"));
stat_input = keyboard_check_pressed(ord("C"));
neft_input = keyboard_check_pressed(vk_lcontrol);

randomize();

round_order = ds_list_create();
round_counter = 0; //keeps track of if it's player phase, enemy phase
turn_counter = 0; //after player phase and enemy phase, this is incremented by 1

ai_unit_counter = 0;

neft_input_counter = 0; //keeps track of which unit is hovered over when neft input

neft_list = ds_list_create(); //list of neft actors,player phase, enemy phase
ally_list = ds_list_create();
aleneti_list = ds_list_create(); //determines the order enemies move in their phase
strucian_list = ds_list_create();

finished_neft_list = ds_list_create();
finished_ally_list = ds_list_create();
finished_aleneti_list = ds_list_create(); //keeps track of alenetians that have finished moving on their round
finished_strucian_list = ds_list_create();

//ds_list_add(round_order,"checking");

//switch around when finished, neft goes first for debug purposes
if (instance_exists(par_neft_faction)) //doesn't fucking work yet because obj_neft doesn't exist or some shit so we repeat this code later
{//commented code is in scr_initialise_grid now
	ds_list_add(round_order,"neft_faction_turn"); //usually 0 on turn_counter
	//with(par_neft_faction)
	//{
	//	ds_list_add(other.neft_list,id)
	//}
}
if (instance_exists(par_strucia_faction))
{
	ds_list_add(round_order,"strucia_faction_turn");
}
if (instance_exists(par_aleneti_faction))
{
	ds_list_add(round_order,"aleneti_faction_turn");
}
if (instance_exists(par_ally_faction))
{
	ds_list_add(round_order,"ally_faction_turn");
}


//turn_max = 0; ds_list_size()

current_actor = noone;

globalvar map; //array, hold onto all nodes in map, holds onto their ids in the order of game grid

map_width = room_width / GRID_SIZE;
map_height = room_height / GRID_SIZE;

spinny_neft_rotation = 0;

//create nodes, create grid

for (xx = 0; xx < map_width; xx += 1) //does the x column first
{
	for (yy = 0; yy < map_height; yy += 1)
	{
		map[xx,yy] = instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE, "Nodes", par_node);
		map[xx,yy].gridX = xx; //lets the nodes know where they are in the grid
		map[xx,yy].gridY = yy;
	}
}

//Populate neighbour lists
for (xx = 0; xx < map_width; xx += 1) //does the x column first
{
	for (yy = 0; yy < map_height; yy += 1)
	{
		node = map[xx,yy]; //access specific node's information
		
		//add left neigbbour
		//check if outside bounds of room
		if (xx > 0){ds_list_add(node.neighbours, map[xx-1,yy])} //access the neighbour by subtracting the x
		//add right neighbour
		if (xx < map_width - 1){ds_list_add(node.neighbours, map[xx+1,yy])}	
		//add top neighbour
		if (yy > 0){ds_list_add(node.neighbours, map[xx,yy-1])}
		//add bottom neighbour
		if (yy < map_height - 1){ds_list_add(node.neighbours, map[xx,yy+1])}
	}
}

//gridX = obj_cursor.x; //where cursor is in relation to grid
//gridY = obj_cursor.y;
//gridX = floor(obj_cursor.x/GRID_SIZE);
//gridY = floor(obj_cursor.y/GRID_SIZE);

//obj_cursor variables (obj_cursor.gridX)
hoverNode = noone; //whichever node the cursor is positioned over

selected_actor = noone;

tempText = noone;


draw_set_font(fnt_courier);
//instance_create_layer(mouse_x,mouse_y,"Instances", obj_cursor);

if (instance_exists(obj_neft))
{
	instance_create_layer(obj_neft.x + (GRID_SIZE / 2),obj_neft.y + (GRID_SIZE / 2),"Menu", obj_cursor);
}
else if (instance_exists(obj_talia))
{
	instance_create_layer(obj_talia.x + (GRID_SIZE / 2),obj_talia.y + (GRID_SIZE / 2),"Menu", obj_cursor);
}
else if (instance_exists(obj_oriel))
{
	instance_create_layer(obj_oriel.x + (GRID_SIZE / 2),obj_oriel.y + (GRID_SIZE / 2),"Menu", obj_cursor);
}
else
{
	instance_create_layer(GRID_SIZE / 2, GRID_SIZE / 2,"Menu", obj_cursor);
}

cursor_move_delay = 0;
cursor_move_delay_default = 4;
cursor_move_occupant = false; //keep track if hovering over unit, slow down cursor if so
cursor_move_slow_initial = 0; //first two cursor moves are slow to increase control, reset upon key release
cursor_move_slow_actor_default = 20; //delay when mouseover actor
cursor_move_delay_mod = 12;


//with (instance_create_layer(5*GRID_SIZE,5*GRID_SIZE,"Instances",obj_hero))
//{
//	gridX = 5;
//	gridY = 5;
//	actor_name = "Neft";
//	map[gridX,gridY].occupant = id;
//}

//with (instance_create_layer(5*GRID_SIZE,8*GRID_SIZE,"Instances",obj_hero))
//{
//	gridX = 5;
//	gridY = 8;
//	actor_name = "Oriel";
//	map[gridX,gridY].occupant = id;
//}