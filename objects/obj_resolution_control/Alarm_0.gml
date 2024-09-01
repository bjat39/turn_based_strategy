/// @description Refresh the window position
window_width = window_get_width() / 2;
window_height = window_get_height() / 2;
window_set_position(display_width / 2 - window_width, display_height / 2 - window_height);
set_position = false;