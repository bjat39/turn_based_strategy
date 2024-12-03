// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_stop_sfx(soundid){
	//dicks = soundid[0] 
	dicks = asset_get_index(soundid[0]);
	//asset_sound
	audio_stop_sound(dicks);
	//audio_play_sound(sfx_shoot,5,0);
}