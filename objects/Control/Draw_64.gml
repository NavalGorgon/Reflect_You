if(died){
	//Handling the fade and transition
	if(black_alpha < 0.8){
		black_alpha += 0.025;
	}

	//draw black fade
	draw_set_alpha(black_alpha);
	draw_rectangle_color(0,0,global.game_width,global.game_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	
	draw_sprite_ext(sprite12,1,game_over_x,game_over_y,gscale,gscale,0,c_white,black_alpha);
	draw_sprite_ext(sRestart,bIndex,button_x,button_y,scale,scale,0,c_white,black_alpha);
}

if(doTransition){
	//Handling the fade and transition
	if(room != spawn_room){
		black_alpha += 1/(game_get_speed(gamespeed_fps)*o_speed);
		if(black_alpha >= 1){
			room_goto(spawn_room)
		}
	}else{
		black_alpha -= 1/(game_get_speed(gamespeed_fps)*o_speed)
		if(black_alpha <= 0){
			doTransition = false;
		}
	}
	

	//draw black fade
	draw_set_alpha(black_alpha);
	draw_rectangle_color(0,0,global.game_width,global.game_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
}

if(doFade){
	if(fade_out){
		black_alpha += 1/(game_get_speed(gamespeed_fps)*o_speed);
		if(black_alpha >= 1){
			fade_out = false;
		}
	}else if(fade_in){
		black_alpha -= 1/(game_get_speed(gamespeed_fps)*o_speed)
		if(black_alpha <= 0){
			doFade = false;
			fade_in = false;
		}
	}
	//draw black fade
	draw_set_alpha(black_alpha);
	draw_rectangle_color(0,0,global.game_width,global.game_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
}