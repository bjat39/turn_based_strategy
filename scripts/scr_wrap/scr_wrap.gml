// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_wrap(val,min_num,max_num){ //Wrap around dialogue options, choose option 3 go back to option 0
	if val > max_num return min_num;
	else if val < min_num return max_num;
	else return val;
}