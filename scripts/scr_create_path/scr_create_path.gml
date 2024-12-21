// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_path(selected_actor, current_node){
	//arg0 = the actor we're creating the path for
	//arg1 = the destination node we want to end up at
	
	//create priority queue
	path = ds_priority_create();
		
	//add current node to queue
	ds_priority_add(path,current_node,current_node.G);
		
	//step through each node, parent to parent, until done
	while(current_node.parent_node != noone)
	{
		//add parent node to queue. priority equal to parent's g score
		ds_priority_add(path, current_node.parent_node,current_node.parent_node.G);
			
		//set current_node to equal to current node's parent, ready to go again!
		current_node = current_node.parent_node;
	}
	do
	{
		//delete lowest priority node (closest to actors) store id in actors
		current_node = ds_priority_delete_min(path);
			
		//add current node's sprite coordinates to selected actor's path
		path_add_point(selected_actor.movement_path,current_node.x,current_node.y,100); //100% of movement cost
			
	}until(ds_priority_empty(path))
		
	//clean up queue
	ds_priority_destroy(path);
			
}