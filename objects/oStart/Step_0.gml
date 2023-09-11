if(point_in_rectangle(mouse_x,mouse_y,bx,by,bx2,by2)){
	image_index = 1;
	if(mouse_check_button_pressed(mb_left)){
		create_cutscene(t_scene_info);
	}
}else{
	image_index = 0;
}