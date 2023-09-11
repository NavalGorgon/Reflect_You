function slime_attack() {
	xSpeed = 0;

	switch(currentAttack){
		case attacks.first:
			//create hitbox on the right frame
			if(floor(x_frame == 3 && hitbox == -1)){
				if (direct == 1){
					hitbox = hitbox_create(12,12,18,12,6,2*direct,0,30,10);
				}else{
					hitbox = hitbox_create(12,12,2,12,6,2*direct,0,30,10);
				}
			}
		
			//switch to idle
			if(x_frame > anim_length -1){
				currentAttack = attacks.second;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				canAttack = false;
				alarm[1] = 1*room_speed;
			}
		break;
	
		case attacks.second:
			//switch to attack
			if((canAttack)){
				currentAttack = attacks.first;
				x_frame = 0; 
				if(oPlayer.x > x){
					direct = 1;
				}else{
					direct = -1;
				}
			}
		break;
	}

	if((distance_to_object(oPlayer) > 1)&&(currentAttack == attacks.second)){
		currentState = states.normal;
	}


}
