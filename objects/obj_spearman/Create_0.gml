/// @description Variables, Check parent variable definitions
type = 1; //1 = melee, 2 = ranged, 3 = magic

moved = false;
attacked = false; //only attack once a turn

//x += 16;
//y += 16;

//attack_pixel_dist = 132; //move range + attack range, total attack range
attack_pixel_dist = 32;

pixel_dist = 100; //Pixel distance, how far they can move
orig_pixel_dist = pixel_dist;

pace = 2;//run speed

orig_node_x = x; //original node
orig_node_y = y;

cur_node_x = x; //currently unused
cur_node_y = y; //node after move

idle_anim = spr_spearman_idle;
run_anim = spr_spearman_run;
//melee_anim = spr_spearman_melee;
attack_anim = spr_spearman_melee;
death_anim = spr_spearman_death;
image_speed = 0.5;

//range = 1; //range in spaces
//Stats
attack = 50;
health_points = 100;