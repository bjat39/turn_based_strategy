/// @description Variables
image_speed = 0.5;
image_xscale = -1;

type = 1;

attacked = false;
moved = false;

cur_node_x = x;
cur_node_y = y;

pace = 2;

pixel_dist = 64; //Pixel distance, how far they can move
orig_pixel_dist = pixel_dist;


idle_anim = spr_spearman_idle;
run_anim = spr_spearman_run;
attack_anim = spr_spearman_melee;
death_anim = spr_spearman_death;


//Stats
attack = 50;
health_points = 100;