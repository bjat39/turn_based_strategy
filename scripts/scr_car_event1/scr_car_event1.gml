// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_car_event1(object,point_x,point_y){
	//Get options
	//dicks = soundid[0] 
	//real_obj = asset_get_index(object[0]);
	
	//returning which decision to display
	car_x = ChatterboxVariableGet("current_x")
	car_y = ChatterboxVariableGet("current_y")
	car_direction = ChatterboxVariableGet("direction")
	//real_obj = asset_get_index(real_obj);
	//real_obj = obj_doggy; //default
	//real_obj = asset_get_index(object[0]);
	
if (current_x == 7 and current_y == 7)
{
	ChatterboxVariableSet("decision","straight");
	//ChatterboxVariableSet("direction","west")
	return //decision = "straight"
}
if (current_x == 6 and current_y == 7)
{
	ChatterboxVariableSet("decision","straight");
    return
}
if (current_x == 5 and current_y == 7)
{
    ChatterboxVariableSet("decision","straight");
	return
}
if (current_x == 4 and current_y == 7)
{
	ChatterboxVariableSet("decision","right");
	return
}
if (current_x == 4 and current_y == 6)
{
	if (car_direction == "north")
	{
		ChatterboxVariableSet("decision","leftright");
		return
	}
	if (car_direction == "east")
	{
		ChatterboxVariableSet("decision","straight");
		return
	}
	if (car_direction == "west")
	{
		ChatterboxVariableSet("decision","straight");
		return
	}
}
if (current_x == 1 and current_y == 4)
    if (car_direction == "north")
	{
		ChatterboxVariableSet("decision","right");
		return
	}
    if (car_direction == "west")
	{
		ChatterboxVariableSet("decision","left");
		return
	}
if (current_x == 1 and current_y == 5)
    if (car_direction == "south")
	{
		ChatterboxVariableSet("decision","left");
		return
	}
    if (car_direction == "west")
	{
		ChatterboxVariableSet("decision","right");
		return
	}
	
	//var distance = point_distance(real_obj.x,real_obj.y,p_x,p_y);
	
}