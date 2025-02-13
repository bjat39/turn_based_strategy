// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_controls() {
    ini_open("controls.ini");
    ini_write_real("Controls", "MoveLeft", global.controls_move_left);
    ini_write_real("Controls", "MoveRight", global.controls_move_right);
    ini_write_real("Controls", "Jump", global.controls_jump);
    ini_close();
}