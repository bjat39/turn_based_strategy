/// @description 
#macro GRID_SIZE 32


globalvar map; //array, hold onto all nodes in map, holds onto their ids in the order of game grid

map_width = room_width / GRID_SIZE;
map_height = room_height / GRID_SIZE;

//create nodes, create grid

for (xx = 0; xx < map_width; xx += 1) //does the x column first
{
	for (yy = 0; yy < map_height; yy += 1)
	{
		map[xx,yy] = instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE, "Nodes", obj_node);
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

instance_create_layer(mouse_x,mouse_y,"Instances", obj_cursor);



with (instance_create_layer(5*GRID_SIZE,5*GRID_SIZE,"Instances",obj_hero))
{
	gridX = 5;
	gridY = 5;
	actor_name = "Neft";
	map[gridX,gridY].occupant = id;
}

with (instance_create_layer(5*GRID_SIZE,8*GRID_SIZE,"Instances",obj_hero))
{
	gridX = 5;
	gridY = 8;
	actor_name = "Oriel";
	map[gridX,gridY].occupant = id;
}