// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_obj_to_point(object,point_x,point_y){
	//dicks = soundid[0] 
	//real_obj = asset_get_index(object[0]);

	//real_obj = ChatterboxVariableGet("object")
	//real_obj = asset_get_index(real_obj);
	real_obj = obj_doggy; //default
	real_obj = asset_get_index(object[0]);
	
	//var distance = point_distance(real_obj.x,real_obj.y,p_x,p_y);
	
	with (real_obj)
	{
		//p_x = ChatterboxVariableGet("point_x")
		//p_y = ChatterboxVariableGet("point_y")
		p_x = object[1];
		p_y = object[2];
		//move_towards_point(other.p_x,other.p_y,1);
		move_towards_point(p_x,p_y,1);
		//var move_vec_x = (x - p_x) / 10;
		//var move_vec_y = (y - p_y) / 10;
		//x = x + move_vec_x;
		//y = y + move_vec_y;
	}
}