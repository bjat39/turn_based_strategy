/// @description 
type = 2; //1 = melee, 2 = ranged, 3 = magic

unit_state = UNIT_STATE.READY;

moved = false;
attacked = false;

pixel_dist = 100; //Pixel distance, how far they can move
orig_pixel_dist = pixel_dist;

pace = 2;//run speed

orig_node_x = x;
orig_node_y = y;

cur_node_x = x;
cur_node_y = y;

idle_anim = spr_archer_idle_strip11;
run_anim = spr_archer_run_strip11;
attack_anim = spr_archer_attack_strip16;
death_anim = spr_archer_death_strip16;
image_speed = 0.5;

my_projectile = obj_arrow;



//Stats
range = 3; //range in spaces
attack = 50;
health_points = 100;