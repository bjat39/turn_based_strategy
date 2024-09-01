/// @description Draws the grid
draw_set_alpha(0.2); //grid semi transparent
mp_grid_draw(global.map_grid);
draw_set_alpha(1);

/// @description Debug path lines
draw_path(global.navigate,0,0,1);
draw_path(global.attack_navigate,0,0,1);