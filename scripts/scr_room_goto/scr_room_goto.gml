// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_goto(room_id){
	//dicks = soundid[0] 
	dicks = asset_get_index(room_id[0]);
	//asset_sound
	room_goto(dicks);
	//audio_play_sound(sfx_shoot,5,0);
}