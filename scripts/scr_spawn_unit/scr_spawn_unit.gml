// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawn_unit(){
	//FUCKING KILL DIE DIE DIE DIE
	map[selected_actor.gridX,selected_actor.gridY].occupant = noone;
		
				//update selected actor's appropriate grid coords
				selected_actor.gridX = gridX;
				selected_actor.gridY = gridY;
		
				//update selected actor's future node
				hoverNode.occupant = selected_actor;
}