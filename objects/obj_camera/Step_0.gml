/// @description camera follow
if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x) / 25; //ease effect, higher number, slower move
y += (yTo - y) / 25;
move_snap((xTo - x) / 25,(yTo - y) / 25);

//if (camWidth < wTo or camWidth > wTo)
//{
//	camWidth = lerp(camWidth, wTo,0.1);
//}
//if (camHeight < hTo or camHeight > hTo)
//{
//	camHeight = lerp(camHeight, hTo,0.1);
//}

//if (camWidth )
//if (camWidth < wTo)
//{
//	lerp(camWidth, wTo,0.1);
//	//camWidth += wTo / size_speed; //ease effect, higher number, slower move
//}
//else if (camWidth > wTo)
//{
//	camWidth -= wTo / size_speed;
//}
//if (camHeight < hTo)
//{
//	camHeight += hTo / size_speed; //ease effect, higher number, slower move
//}
//else if (camHeight > hTo)
//{
//	camHeight -= hTo / size_speed;
//}


camera_set_view_pos(view_camera[0],floor(x-(camWidth*0.5)),floor(y-(camHeight*0.5)));


//camera_set_view_size(view_camera[0],camWidth,camHeight)
//camera_set_view_size(view_camera[0],floor(camWidth),floor(camHeight));