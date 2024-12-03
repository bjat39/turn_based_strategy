/// @description 
//window_set_fullscreen(true);
//if (room_get_name(room) == "room_1start")
//{
	ChatterboxLoadFromFile("opening_scene.yarn"); //Load file
	ChatterboxLoadFromFile("road_scene.yarn");
//}

chatterbox = ChatterboxCreate(); //Create a chatterbox

//if (room_get_name(room) == "room_1start")
//{
	ChatterboxAddFunction("bg",scr_background_set_index); //Add function to change background index
	ChatterboxAddFunction("sfx",scr_play_sfx);
	ChatterboxAddFunction("stop_sfx",scr_stop_sfx);
	ChatterboxAddFunction("black_screen",scr_black_screen);
	ChatterboxAddFunction("move",scr_move_obj_to_point);
	ChatterboxAddFunction("hud_off",scr_turn_off_hud);
	ChatterboxAddFunction("left_index",scr_set_left_char_index);
	ChatterboxAddFunction("room_goto",scr_room_goto);
	ChatterboxAddFunction("char_vis",scr_set_vis_char);
	ChatterboxAddFunction("background_vis",scr_set_vis_background);
	ChatterboxJump(chatterbox,"car_decision");//ChatterboxJump(chatterbox,"First_Start"); //Go to "Start" node

	option_index = 0; //Initialise option index
	scr_chatterbox_update() //Get current node and current node text
	size = [1,0.9]; //Character sprite scale (small and large)
	colour = [c_white,c_ltgray]; //Character sprite blend (dark out character)

	char_current = 1;
	char_speed = 3.5;

	left_char = "";
	right_char = "";

	char_id = "";
	
	global.hud_on = true;
	global.hud_timer = 0;

//}

//else if (room_get_name(room) == "room_road")
//{
//	ChatterboxLoadFromFile("road_scene.yarn");
//}



right_char_index = 0;//0;
left_char_index = 0;//2;//1;
old_right_char_index = 0;
old_left_char_index = 0;

right_slide_in = 20;
left_slide_in = 20;
finish_right_slide = true;
finish_left_slide = true;


//boxWidth = 12;
//stringHeight = string_height(text);