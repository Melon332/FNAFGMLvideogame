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



