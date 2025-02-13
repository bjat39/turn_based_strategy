audio_pause_all()/// @description 
var count = ChatterboxGetOptionCount(chatterbox); //get the number of options we have
//progress dialogue
if (global.hud_on == false)
{
	global.hud_timer -= 1;
	if global.hud_timer < 0
	{
		global.hud_on = true;
	}
}
else
if ChatterboxIsWaiting(chatterbox) and (keyboard_check_pressed(obj_game.accept_input) or keyboard_check(obj_game.return_input)) //waiting for human input
{
	var str_len = string_length(ChatterboxGetContent(chatterbox,0));
	if (char_current < str_len)
    {
		char_current = str_len;
    }
	else
	{
		//audio_play_sound(sfx_confirm,3,0);
		ChatterboxContinue(chatterbox);
		scr_chatterbox_update();
		char_current = 0;
	}
}
else if count //Is Chatterbox presenting the user with options ie count!= 0
{
	var key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up); //down = 1, up = -1, both/neither = 0
	
	//Move option_index twice if next option is invalid
	
	repeat (1 + (ChatterboxGetOptionConditionBool(chatterbox, scr_wrap(option_index + key,0,count - 1)) == false)) //repeat if statement twice, go over option
	{
		option_index = scr_wrap(option_index + key, 0, count - 1);
	}
	
	if (keyboard_check_pressed(vk_space))
	{
		audio_play_sound(sfx_confirm,3,0);
		ChatterboxSelect(chatterbox,option_index);
		char_current = 0;
		option_index = 0;
		
		scr_chatterbox_update();
	}
}
//else if anger emotion, camera also?

//If chatterbox has ended
if (ChatterboxIsStopped(chatterbox))
{
	instance_destroy();
}