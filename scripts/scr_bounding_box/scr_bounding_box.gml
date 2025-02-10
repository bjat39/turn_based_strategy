// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_attack_bounding_box(){
    // ... (existing code)

    // Initialize bounding box variables
    var min_x = selected_actor.x, min_y = selected_actor.y;
    var max_x = selected_actor.x, max_y = selected_actor.y;

    // Loop through the closed list and update the bounding box
    for(ii = 0; ii < ds_list_size(closed); ii++){
        current_node = ds_list_find_value(closed, ii);

        scr_colour_attack_node(current_node);

        // Update the bounding box
        min_x = min(min_x, current_node.x);
        min_y = min(min_y, current_node.y);
        max_x = max(max_x, current_node.x);
        max_y = max(max_y, current_node.y);
    }

    // Destroy the closed list
    ds_list_destroy(closed);

    // Return the bounding box as a struct
    return {
        min_x: min_x,
        min_y: min_y,
        max_x: max_x,
        max_y: max_y
    };
}