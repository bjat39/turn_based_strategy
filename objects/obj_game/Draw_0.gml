/// @description 
if (hoverNode != noone)
{	
	draw_sprite(spr_selected,0,gridX*GRID_SIZE,gridY*GRID_SIZE);
}

spinny_neft_rotation += 8;

draw_sprite_ext(spr_spearman,0,500,300,1,1,spinny_neft_rotation,c_white,1)