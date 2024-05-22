cx = camera_get_view_x(view_camera[0]);

view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

draw_set_color(c_blue);
draw_rectangle(100, 100, 300, 200, true);

viewport_w = camera_get_view_x(view_camera[0]);
viewport_h = camera_get_view_y(view_camera[0]);

speed = 0;

camera_speed = 10; //Lower value = faster - Higher value = slower dont ask me its the tutorials bro

boundless = false;

current_room_width = obj_room.sprite_width;

has_clicked_into_door = false;
is_hovering_door = false;
current_interacted_door = -1;

door_closed = false;
flashlight_on = false;

function handle_camera()
{
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
}

//Function to store the interacted door
function store_current_door(id)
{
	current_interacted_door = id;
}

//Opens and closes the current door
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

//Handles activating the flashlight on the current door
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



