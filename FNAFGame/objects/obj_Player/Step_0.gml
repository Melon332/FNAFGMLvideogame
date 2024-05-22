if(has_clicked_into_door)
{
	handle_door();
	handle_flashlight();
	if(flashlight_on == false && door_closed == false)
	{
		obj_door.sprite_index = variable_instance_get(current_interacted_door, "door_image");
	}
	if(point_in_rectangle(mouse_x, mouse_y, 0, room_height * 0.9 - 75, room_width - 50, room_height * 0.9 + 75))
	{
		has_clicked_into_door = false;
		obj_door.sprite_index = -1;
		current_interacted_door = 0;
	}
}

if(has_clicked_into_door) return;

handle_camera();

if(speed == 0) return;

cx += speed;


if(!boundless)
{
	cx = clamp(cx, 0, current_room_width-view_w);	
}

camera_set_view_pos(view_camera[0], cx, camera_get_view_y(view_camera[0]));


