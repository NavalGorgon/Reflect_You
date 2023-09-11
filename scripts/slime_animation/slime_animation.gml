function slime_animation() {
	anim_length = 0;
	var frame_width = 32;
	var frame_height = 25;
	var anim_speed = 9;
	var init_frame = 0;

	switch currentState {
		case states.normal:
			if (xSpeed!=0){
				anim_length = 4;
				y_frame = 2;
			}else{
				y_frame = 0;
				anim_length = 4;
			}
		break;
	
		case states.jump:
			if (xSpeed!=0){
				anim_length = 4;
				y_frame = 2;
			}else{
				y_frame = 0;
				anim_length = 4;
			}
		break;
	
		case states.attack:
			if(currentAttack == attacks.first){
				anim_length = 5;
				y_frame = 1;
			}else{
				anim_length = 4;
				y_frame = 0;
			}
		break;
	
		case states.hit:
			anim_length = 4;
			y_frame = 3;
		break;
	
		case states.death:
			anim_length = 5;
			y_frame = 4;
		break;
	}

	if direct == 1{
		mySprite = spriteR;
	}else{
		mySprite = spriteL;
	}

	//Choose whether to increment x_frame
	
	if ((x_frame + anim_speed/60) < anim_length){
		x_frame += anim_speed/60;
	
	}else{
		x_frame = init_frame;
	}

	//Draw Base
	draw_sprite_part_ext(mySprite,0,floor(x_frame)*frame_width,y_frame*frame_height,frame_width,frame_height,x,y,1,1,c_white,1);


}
