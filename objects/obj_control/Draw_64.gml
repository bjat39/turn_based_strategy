/// @description 
draw_text_transformed(5,5,"state:\nselected:\nenemy:\nmoving:\nattacking:\nai_selected\nai_id\nai_activated\ndamage_dealt:",1.5,1.5,0);
draw_text_transformed(190, 5, global.state, 1.5,1.5,0);
draw_text_transformed(190, 37, global.selected, 1.5,1.5,0); //id of who is selected
draw_text_transformed(190, 69, global.enemy, 1.5,1.5,0); //enemy id

draw_text_transformed(190, 101, global.moving, 1.5,1.5,0);
draw_text_transformed(190, 136, global.attacking, 1.5,1.5,0);

draw_text_transformed(190, 168, global.ai_selected, 1.5,1.5,0); //ai selected
draw_text_transformed(190, 203, global.ai_id, 1.5,1.5,0);
draw_text_transformed(190, 238, global.ai_activated, 1.5,1.5,0); //unit able to move

draw_text_transformed(190, 273, global.damage_dealt, 1.5,1.5,0);