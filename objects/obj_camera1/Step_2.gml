/// @description 
//Get current camera position

var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);

camW = camera_get_view_width(camera);
camH = camera_get_view_height(camera);

//Set target camera position
if (instance_exists(obj_cursor))
{
	var targetX = obj_cursor.x - camW/2;
	var targetY = obj_cursor.y - camH/2
}
else
{
	var targetX = 0;
	var targetY = 0;
}

//Clamp the target to room bounds
targetX = clamp(targetX,0,room_width - camW);
targetY = clamp(targetY, 0, room_height - camH);

//Smoothly move the camera to the target position
camX = lerp(camX, targetX, CAM_SMOOTH *3);
camY = lerp(camY,targetY, CAM_SMOOTH *3);

//Scroll zoom
//var wheel = mouse_wheel_down() - mouse_wheel_up();
//if (wheel != 0) {
//	wheel *= 0.1;//0.01;
	
	camW = lerp(camW, RES_W * size1, CAM_SMOOTH / 6);//6);
	camH = lerp(camH,RES_H * size1, CAM_SMOOTH / 6);//6);
	
	//Add to size
	//if (addH >=)
	//var addW = camW * wheel;
	//var addH = camH * wheel;
	
	//camW += addW;
	//camH += addH;
	
	//Positioin, add to camX in order to center
	//camX -= addW / 2;
	//camY -= addH / 2;
	
	//Clamping zoom
	var prevWidth = camW;
	var prevHeight = camH;
	
	camW = clamp(camW, RES_W / 2, room_width);
	camH = clamp(camH, RES_H / 2, room_width);
	
	if(camW / camH == 1.77777777778 and (prevWidth == camW or prevHeight == camH)){
		//camX -= addW / 2;
		//camY -= addH / 2
		//Clamp the movement
		camX = clamp(camX,0,room_width - camW);
		camY = clamp(camY,0,room_height -camH);
	//}
}


//Apply camera position
camera_set_view_pos(camera,camX,camY);
camera_set_view_size(camera,camW,camH);