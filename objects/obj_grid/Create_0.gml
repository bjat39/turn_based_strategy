/// @description Creates the grid
enum STATES
{
	P_TURN,
	AI_TURN,
	FAIL_STATE
}

global.cell_size = 32;

//global.map_grid = mp_grid_create(0,0,room_width / global.cell_size, room_height / global.cell_size,global.cell_size,global.cell_size); //(top left of the grid, amount of cells, size)
//global.map_grid = mp_grid_create(48,112,17,7,global.cell_size,global.cell_size); //(top left of the grid, amount of cells, size)
grid_rows = room_width / global.cell_size; //number of rows along x axis
grid_cols = room_height / global.cell_size; //number of columns along y axis

global.map_grid = mp_grid_create(16,16,grid_rows,grid_cols,global.cell_size,global.cell_size); //(top left of the grid, amount of cells, size)
//global.map_grid = mp_grid_create(16,80,grid_rows,grid_cols,global.cell_size,global.cell_size); //(top left of the grid, amount of cells, size)
//global.map_grid = mp_grid_create(0,0,grid_rows,grid_cols,global.cell_size,global.cell_size); //(top left of the grid, amount of cells, size)
global.navigate = path_add(); //Path we use
global.attack_navigate = path_add(); //Attack Path we use