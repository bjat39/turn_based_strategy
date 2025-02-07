/// @description 
neighbours = ds_list_create(); //1d array, sequential, all the nodes surrounding it
//mp_grid_get_cell()

colour = c_white;

occupant = noone; //who is occupying
passable = true;

gridX = 0;
gridY = 0;

terrain = "node" //basic open node

terrain_type = "noone"

//Pathfinding variables

parent_node = noone; //hold onto id of node that scores it, used to make a path to follow, get the parent of the parent etc etc until we reach the source node. used to be called just "parent"

G = 0; //distance between current node and start node, how far away this node is from the source node
H = 0; //estimated movement cost, used for ai moving
F = 0;
//for a star, h would be the estimated distance from current node to end node, and f is the total cost for the node (f = g + h)

attack_G = 0; //used for calculating attack ranges
attack_parent_node = noone;

move_node = false; //check if valid node for movement
attack_node = false;
faux_attack_node = false; //colour in nodes in attack range

cost = 1;

//Terrain statistics
terrain_avoid = 0;
terrain_defense = 0;