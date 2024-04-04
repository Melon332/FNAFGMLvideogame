if(has_clicked_into_door)
{
	if(mouse_check_button_pressed(mb_right))
	{
		has_clicked_into_door = false;
		show_debug_message("Has left room!");
		obj_door.sprite_index = -1;
	}
}



if(has_clicked_into_door) return;

viewport_w = camera_get_view_x(view_camera[0]);

if(mouse_x < viewport_w+view_w/2-400)
{
	speed = (mouse_x-(viewport_w+view_w/2-400)) / camera_speed;
}

else if(mouse_x > viewport_w+view_w/2+400)
{
	speed = (mouse_x-(viewport_w+view_w/2+400)) / camera_speed;
}
else 
{
	speed = 0;
}


if(speed == 0) return;

cx += speed;


if(!boundless)
{
	cx = clamp(cx, 0, current_room_width-view_w);	
}

camera_set_view_pos(view_camera[0], cx, camera_get_view_y(view_camera[0]));

