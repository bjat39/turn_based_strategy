// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_limited_string(new_string, max_length) {
    // Check if the new string is too long
    if (string_length(new_string) > max_length) {
        // Create a new string with the old characters and a full stop
        return string_copy(new_string, 1, max_length - 1) + ".";
    } else {
        // Return the original string
        return new_string;
    }
}