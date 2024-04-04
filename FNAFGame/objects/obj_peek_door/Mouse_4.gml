if(obj_player.has_clicked_into_door) return;

obj_player.store_current_door(id);
obj_player.has_clicked_into_door = true;

show_debug_message("Has entered room!");





