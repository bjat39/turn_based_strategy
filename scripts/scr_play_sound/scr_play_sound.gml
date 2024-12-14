// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_play_sound(sfx_id,priority,loops,sfx_gain){
	//dicks = asset_get_index(sfx_id[0]);
	//if (!audio_is_playing(sfx_id))
	//{
	audio_play_sound(sfx_id,priority,loops,sfx_gain);
	//}
}