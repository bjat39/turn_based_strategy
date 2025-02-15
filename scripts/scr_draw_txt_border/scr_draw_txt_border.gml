// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_txt_border(xx,yy,text,col1,col2)
{
    draw_set_colour(col1);
	draw_text(xx+1, yy+1, text);  
	draw_text(xx-1, yy-1, text);  
	draw_text(xx,   yy+1, text);  
	draw_text(xx+1,   yy, text);  
	draw_text(xx,   yy-1, text);  
	draw_text(xx-1,   yy, text);  
	draw_text(xx-1, yy+1, text);  
	draw_text(xx+1, yy-1, text);  
    draw_set_colour(col2);
    draw_text(xx,yy,text);
}