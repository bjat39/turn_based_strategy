/// @description 
#macro RES_W 320//384//800//1024//768//640//320
#macro RES_H 180//216//450//576//432//360//180
#macro RES_SCALE 4//1.5//1//1.5//4.5//3

#macro CAM_SMOOTH 0.1

size = 1;
faux_size = size;

//Enable views
view_enabled = true;
view_visible[0] = true;

//Create camera
camera = camera_create_view(0,0,RES_W,RES_H);

camW = camera_get_view_width(camera);
camH = camera_get_view_height(camera);

view_set_camera(0,camera);

//Resize window and application surface (resolution)
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
//Resolution
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

display_set_gui_size(RES_W,RES_H);

//Center window
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);

if (instance_exists(obj_cursor))
{
	camera_set_view_pos(camera,obj_cursor.x,obj_cursor.y);
}
else
{
	camera_set_view_pos(camera,0,0);
}

//window_set_fullscreen(true);