function animation() {
	anim_length = 0;
	var frame_width = 50;
	var frame_height = 37;
	var anim_speed = 15;
	var init_frame = 0;

	switch currentState {
		case states.normal:
			if(sheath == true){
				if(right && left) || (!right && !left){
					y_frame = 0;
					anim_length = 4;
					anim_speed = 6;
				}else{
					anim_length = 6;
					y_frame = 2;
				}
			}else{
				if(right && left) || (!right && !left){
					y_frame = 8;
					anim_length = 4;
					anim_speed = 6;
				}else{
					anim_length = 6;
					y_frame = 28;
				}
			}
		break;
	
		case states.dash:
			y_frame = 29;
			init_frame = 3;
			anim_length = 4;
		break;
	
		case states.sheath:
			if(sheath == true){
				anim_length = 8;
				init_frame = 4;
			}else{
				anim_length = 4;
				init_frame = 0;
			}
			y_frame = 14;
		break;
	
		case states.prep:
			anim_length = 2;
			y_frame = 3;
		break;
	
		case states.jump:
			if((canJump)||(oInventory.ds_skills[# 0, 0] == 0))
				if(ySpeed>0){
					anim_length = 2;
					y_frame = 5;
				}else{
					anim_length = 1;
					y_frame = 4;
					init_frame = 1;
			}else{
				anim_length = 6;
				y_frame = 4;
				init_frame = 2;
			}
		break;
	
		case states.attack:
			anim_speed = 12;
			if((oInventory.ds_equip[# 2, 0] != 0)&&(sheath == false)){
				switch currentAttack {
					case attacks.first:
						anim_length = 6;
						y_frame = 9;
					break;
			
					case attacks.second:
						anim_length = 7;
						y_frame = 10;
					break;
			
					case attacks.third:
						anim_length = 7;
						y_frame = 11;
					break;
				}
			}else{
				switch currentAttack {
					case attacks.first:
						anim_length = 5;
						y_frame = 23;
					break;
			
					case attacks.second:
						anim_length = 5;
						y_frame = 24;
					break;
			
					case attacks.third:
						anim_length = 5;
						y_frame = 25;
					break;
				}
			}
		break;
	
		case states.block:
			anim_speed = 12;
			y_frame = 17;
			init_frame = 3;
			anim_length = 8;
		break;
	
		case states.air_attack:
			anim_speed = 12;
			switch currentAttack {
				case attacks.first:
					anim_length = 5;
					y_frame = 19;
				break;
			
				case attacks.second:
					anim_length = 4;
					y_frame = 20;
				break;
			
				case attacks.third:
					anim_length = 4;
					init_frame = 2;
					y_frame = 30;
			}
		break;
	
		case states.shoot:
			anim_length = 8;
			y_frame = 26;
		break;
	
		case states.hit:
			anim_length = 3;
			y_frame = 12;
		break;
	
		case states.death:
			anim_length = 7;
			y_frame = 13;
			init_frame = 4;
		break;
	
		case states.sprint:
			if(right && left) || (!right && !left){
				y_frame = 0;
				anim_length = 4;
				anim_speed = 6;
			}else{
				anim_length = 6;
				y_frame = 29;
			}
		break;
	
		case states.ledge:
			y_frame = 6;
			anim_length = 4;
		break;
	}

	if direct == 1{
		mySprite = sPlayerR;
	}else{
		mySprite = sPlayerL;
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
