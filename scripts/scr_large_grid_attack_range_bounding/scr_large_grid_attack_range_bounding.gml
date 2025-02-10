function large_grid_attack_range_bounding(unit, move_nodes) {
// Function to get the attack ranges for a given unit
    // Get the unit's position and move range
    var unit_x = unit.x;
    var unit_y = unit.y;
    var move_range = unit.move_range;

    // Create a 2D array to store the attack ranges
    var attack_ranges = array_create(move_range * 2 + 1, array_create(move_range * 2 + 1, false));

    // Get the bounding box for the move nodes
    var min_x = unit_x - move_range;
    var min_y = unit_y - move_range;
    var max_x = unit_x + move_range;
    var max_y = unit_y + move_range;

    // Loop through the move nodes and check if each tile is within the attack range
    var num_move_nodes = ds_list_size(move_nodes);
    for (var i = 0; i < num_move_nodes; i++) {
        var move_node = ds_list_find_value(move_nodes, i);
        var distance = max(abs(move_node.x - unit_x), abs(move_node.y - unit_y));

        // If the distance is within the attack range, mark the tile as attackable
        if (distance <= move_range) {
            attack_ranges[move_node.x - min_x][move_node.y - min_y] = true;
        }
    }

    return attack_ranges;
}
