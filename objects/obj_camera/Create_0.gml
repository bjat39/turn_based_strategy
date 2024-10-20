/// @description Pretty scuffed camera
camWidth = camera_get_view_width(view_camera[0]);//160; //320
camHeight = camera_get_view_height(view_camera[0]); //90; //180

//new_width = 320;
new_height = 180;

surface_resize(application_surface,camWidth+1,camHeight+1);//add one to base resolution and camera size, camera is not jittery pixel by pixel
application_surface_draw_enable(false); //disable application surface drawing

follow = obj_talia;

x = follow.x;
y = follow.y;

xTo = x;
yTo = y;

//Clamp Variables
min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

//wTo = 100//camWidth; //aim
//hTo = 100//camHeight;