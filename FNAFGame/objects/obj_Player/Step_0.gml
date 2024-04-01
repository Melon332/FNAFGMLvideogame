viewport_w = camera_get_view_x(view_camera[0]);

if(mouse_x < viewport_w+view_w/2)
{
	speed = (mouse_x-(viewport_w+view_w/2)) / camera_speed;
}

else if(mouse_x > viewport_w+view_w/2+200)
{
	speed = (mouse_x-(viewport_w+view_w/2)) / camera_speed;
}
else 
{
	speed = 0;
}


if(speed == 0) return;

cx += speed;


if(!boundless)
{
	cx = clamp(cx, 0, test-view_w);	
}

camera_set_view_pos(view_camera[0], cx, camera_get_view_y(view_camera[0]));

