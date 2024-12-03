// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_car_event2(player_response){
	//Get options
	//dicks = soundid[0] 
	//real_obj = asset_get_index(object[0]);
	
	//returning which decision to display
	car_x = ChatterboxVariableGet("current_x")
	car_y = ChatterboxVariableGet("current_y")
	car_direction = ChatterboxVariableGet("direction")
	answer = player_response[0]
	//real_obj = asset_get_index(real_obj);
	//real_obj = obj_doggy; //default
	//real_obj = asset_get_index(object[0]);
	
if (current_x == 7 and current_y == 7)
{
	if (answer == "straight")
	{
		ChatterboxVariableSet("current_x",6)
		ChatterboxVariableSet("direction","west")
		return
	}
}
if (current_x == 6 and current_y == 7)
{
	if (answer == "straight")
	{
		ChatterboxVariableSet("current_x",5)
		ChatterboxVariableSet("direction","west")
		return
	}
}
if (current_x == 5 and current_y == 7)
{
	if (answer == "straight")
	{
		ChatterboxVariableSet("current_x",4)
		ChatterboxVariableSet("direction","west")
		return
	}
}
if (current_x == 4 and current_y == 7)
{
	if (answer == "straight")
	{
		ChatterboxVariableSet("current_y",6)
		ChatterboxVariableSet("direction","north")
		return
	}
}
if (current_x == 4 and current_y == 6)
{
	if (answer == "left")
	{
		ChatterboxVariableSet("current_y",6)
		ChatterboxVariableSet("direction","north")
		return
	}
}
//if $current_x == 1 and $current_y == 4
//    if $direction == "north"
//        You drive onwards.
//        ->Turn right
//            set $current_x = 2
//            set $direction = "east"
//            jump drive_event_cont
//    endif
//    if $direction == "west"
//        You drive onwards.
//        ->Turn left
//            set $current_y = 5
//            set $direction = "south"
//            jump drive_event_cont
//    endif
//endif
//if $current_x == 1 and $current_y == 5
//    if $direction == "north"
//        You drive onwards.
//        ->Turn right
//            set $current_x = 2
//            jump drive_event_cont
//    endif
//    if $direction == "west"
//        You drive onwards.
//        ->Turn right
//            set $current_x = 2
//            jump drive_event_cont
//    endif
//endif
	
	//var distance = point_distance(real_obj.x,real_obj.y,p_x,p_y);
	
}