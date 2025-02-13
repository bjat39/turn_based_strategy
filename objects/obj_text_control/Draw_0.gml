/// @description Draw sprites, text and options
if (global.hud_on == true)
{

	draw_set_font(fnt_courier);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var margin_text = 60;//50; //Horizontal text margin and box size
	var margin_text_x = 15;
	var margin_char = 235;//225; //Horizontal character margin 
	//left margin char is not accounted for

	if IsChatterbox(chatterbox) and text != undefined //nothing is drawn with no text
	{
		//var me = (ChatterboxGetContentSpeaker(chatterbox,0) == "Me");
		var me = (ChatterboxGetContentSpeaker(chatterbox,0) == "Me" or ChatterboxGetContentSpeaker(chatterbox,0) == noone);
		char_id = ChatterboxGetContentSpeaker(chatterbox,0);
		old_right_char_index = right_char_index;
		old_left_char_index = left_char_index;
		
		if (char_id == "Triangleface" or char_id == "Some guy" or char_id == "Bingo")
		{
			right_char_index = 3;
		}
		else if (char_id == "Tall guy" or char_id == "Sponge")
		{
			right_char_index = 1;
		}
		else if (char_id == "Doggy" or char_id == "Possan")
		{
			right_char_index = 4;
		}
		else if (char_id == "Floor guy")
		{
			right_char_index = 5;
		}
		else if (char_id == "Me")
		{
			left_char_index = 2;
		}
		
		if (right_char_index == old_right_char_index)
		{
			if (finish_right_slide == false)
			{
				if (right_slide_in >= 1)
				{
					right_slide_in = max(right_slide_in/1.1,0);
				}
				else
				{
					finish_right_slide = true;
				}
			}
			draw_sprite_ext(neft_pixel, right_char_index, margin_char + right_slide_in, room_height -75,size[me],size[me],0,colour[me],1);
		}
		else if (right_char_index != old_right_char_index and finish_right_slide == true)
		{
			right_slide_in = 20;
			finish_right_slide = false;
			draw_sprite_ext(neft_pixel, right_char_index, margin_char + right_slide_in, room_height -75,size[me],size[me],0,colour[me],1);
		}
		else
		{
			draw_sprite_ext(neft_pixel, right_char_index, margin_char + right_slide_in, room_height -75,size[me],size[me],0,colour[me],1);
		}
		
		//Left
		if (left_char_index == old_left_char_index)
		{
			if (finish_left_slide == false)
			{
				if (left_slide_in >= 1)
				{
					left_slide_in = max(left_slide_in/1.1,0);
				}
				else
				{
					finish_left_slide = true;
				}
			}
			draw_sprite_ext(spr_portrait_neft_beta, left_char_index, room_width - margin_char - left_slide_in, room_height -75,size[!me],size[!me],0,colour[!me],1);
		}
		else if (left_char_index != old_left_char_index and finish_left_slide == true)
		{
			left_slide_in = 20;
			finish_left_slide = false; //spr_characters
			draw_sprite_ext(spr_portrait_neft_beta, left_char_index, room_width - margin_char - left_slide_in, room_height -75,size[!me],size[!me],0,colour[!me],1);
		}
		else
		{
			draw_sprite_ext(spr_portrait_neft_beta, left_char_index, room_width - margin_char - left_slide_in, room_height -75,size[!me],size[!me],0,colour[!me],1);
		}
		//draw_sprite_ext(spr_characters, left_char_index, room_width - margin_char, room_height -75,size[!me],size[!me],0,colour[!me],1);
		
		
		var box_height = room_height - (margin_text / 2);
		var yy = room_height - (margin_text / 1.25);
	
		scr_draw_rectangle_center(room_width / 2, box_height, room_width, margin_text,false, c_black,0.6); //opacity used to be 0.5
	
		//align text on left or right depending on character
		//draw_set_halign(me ? fa_left : fa_right); //If current text is me, then left aligned, otherwise right aligned
		draw_set_halign(fa_left);
		var xx = 8;//me ? margin_text_x : room_width - margin_text_x;
		var boxWidth = 300;
		var stringHeight = 12;
		var str_len = string_length(ChatterboxGetContent(chatterbox,0));
		if (char_current < str_len)
	    {
			char_current += char_speed;
	    }
		var _str = string_copy(ChatterboxGetContent(chatterbox,0), 1, char_current);
		draw_text_ext(xx,yy,_str,stringHeight,boxWidth);
		//draw_text_ext(xx,yy,text,stringHeight,boxWidth);
	
		//if there are options, draw them to the center of the screen
		if ChatterboxGetOptionCount(chatterbox)
		{
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
		
			//Code different lengths
			//ChatterboxGetOption();
		
			for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++)
			{
				if ChatterboxGetOptionConditionBool(chatterbox,i)
				{
					xx = room_width / 2;
					yy = (room_height / 7) * (i+1);//(room_height / 7) * (i+1); //(room_height / 6) * (i + 2)
				
					var icon = ""; //select arrow
					if (option_index == i) icon = "> ";
					var option = ChatterboxGetOption(chatterbox,i);
				
					var width = 16 + string_width(option);//100;
					var height = 22;//2 + string_height(option)//24;//26;
				
					scr_draw_rectangle_center(xx,yy,width,height,false,c_black,0.8); //Opacity used to be 0.5
				
					draw_text(xx,yy,icon + option);
				}
			}
		}
	}
}