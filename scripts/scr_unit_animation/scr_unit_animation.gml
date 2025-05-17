// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_unit_animation(){
	// Initialize variables in Create Event if not already
	// frame_direction: 1 for forward, -1 for backward
	// pause_timer: countdown for pause duration (in steps, 60 steps = 1 second)

	if (!variable_local_exists("frame_direction")) {
	    frame_index = 0;                 // Current frame
	    frame_direction = 1;             // Direction of animation
	    pause_timer = 0;                 // Timer for pauses
	}

	// Animate frames
	if (pause_timer > 0) {
	    pause_timer -= 1; // Waiting during pause
	} else {
	    // Advance frame
	    frame_index += frame_direction;

	    // Check for bounds and handle pauses
	    var max_frame = sprite_get_number(sprite_index) - 1; // Zero-based index

	    if (frame_index >= max_frame) {
	        frame_index = max_frame;
	        frame_direction = -1; // Reverse direction
	        pause_timer = 60;     // Pause for 1 second (assuming 60 FPS)
	    } 
    
	    if (frame_index <= 0) {
	        frame_index = 0;
	        frame_direction = 1;  // Forward again
	        pause_timer = 60;     // Pause for 1 second
	    }
	}
}