//Restart Button

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);


if((button_x<mousex)&&(button_y<mousey)&&(mousex<button_x2)&&(mousey<button_y2)){
	bIndex = 1;
	if((died)&&(mouse_check_button_pressed(mb_left))){
		with oInventory{
			ds_player_info[# 1, 2] = ds_player_info[# 1, 5];
		}
		room_restart();
		died = false;
	}
}else{
	bIndex = 0;
}

