/// @description 
y -= vspd;

vspd -= grav;

if (y >= 0){
	y = ground;
	grav = 0;
	fade = true;
}

if(fade){
	alpha -= .01;
}

if(alpha <= 0){
	instance_destroy();
}