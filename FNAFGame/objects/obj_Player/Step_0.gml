if(has_clicked_into_door)
{
	handle_door();
	handle_flashlight();
	if(flashlight_on == false && door_closed == false)
	{
		show_debug_message("doyouoorwawre");
		obj_door.sprite_index = variable_instance_get(current_interacted_door, "door_image");
	}
	if(point_in_rectangle(mouse_x, mouse_y, 0, room_height * 0.9 - 75, room_width - 50, room_height * 0.9 + 75))
	{
		has_clicked_into_door = false;
		hej();
		obj_door.sprite_index = -1;
		current_interacted_door = 0;
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

function hej()
{
	show_debug_message("Has left room!");
}

function store_current_door(id)
{
	current_interacted_door = id;
}

function handle_door()
{
	if(flashlight_on) return; 
	if(keyboard_check(vk_shift))
	{
		show_debug_message("wtf");
	    obj_door.sprite_index = variable_instance_get(current_interacted_door, "closed_door_image");
		door_closed = true;
	}
	else
	{
		door_closed = false;
	}
}

function handle_flashlight()
{
	if(door_closed) return;
		if(keyboard_check(vk_control))
	{
		flashlight_on = true;
		obj_door.sprite_index = variable_instance_get(current_interacted_door, "flashlight_door_image");
	}
	else
	{
		flashlight_on = false;
	}
}
