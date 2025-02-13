/// @description 
if (!instance_exists(obj_battle_manager) and obj_game.player_state != "cursor_selected")
{
	obj_game.player_state = "cursor_explore";
}
if (obj_game.player_state == "cursor_selected")
{
	
}
else
{
	scr_wipe_nodes();
}