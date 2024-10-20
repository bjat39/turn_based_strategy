/// @description 
gpu_set_blendenable(false);
var scale = window_get_width()/camWidth;
draw_surface_ext
(
	application_surface,
	0 - (frac(x)*scale),
	0 - (frac(y)*scale),
	scale,
	scale,
	0,
	c_white,
	1.0
);
gpu_set_blendenable(true);