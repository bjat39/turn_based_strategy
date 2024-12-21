// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_heuristic(goal,node){
//Finds manhattan distance between two nodes
//arg0 = goal node
//arg1 = current node

//add all neighbours to the list, but instaead of going through them indiscriminately 
//we add heuristic, compare current node to destination node, prioritise predicted closest nodes
//priority queue based on heuristic

temp = abs(goal.gridX - node.gridX) + abs(goal.gridY - node.gridY);
//lowest score is usually the most direct path
return temp;
}