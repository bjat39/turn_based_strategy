/// @description Variables
image_speed = 0.5;
image_xscale = -1;

type = 2;

attacked = false;
moved = false;
acquired_targets = false; //only for ranged

cur_node_x = x;
cur_node_y = y;

pace = 2;

pixel_dist = 64; //Pixel distance, how far they can move
orig_pixel_dist = pixel_dist;

idle_anim = spr_archer_idle_strip11;
run_anim = spr_archer_run_strip11;
attack_anim = spr_archer_attack_strip16;
death_anim = spr_archer_death_strip16;

my_projectile = obj_arrow;

//Stats
attack = 20;
health_points = 50;