function fist_state() {
	xSpeed = 0;
	var frm = 60/15;
	var dmg = 5;

	if (x_frame >= anim_length-0.5) {
		currentState = states.normal;
		currentAttack = attacks.first;
		x_frame = 0;
	}

	switch(currentAttack){
		case attacks.first:
			//create hitbox on the right frame
			if(floor(x_frame) == 2 && hitbox == -1){
				if (direct == 1){
					hitbox = hitbox_create(15,7,29,20,frm,0.5*direct,0,30,dmg);
				}else{
					hitbox = hitbox_create(15,7,6,20,frm,0.5*direct,0,30,dmg);
				}
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length -2)){
				currentAttack = attacks.second;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				attack = false;
			}
		break;
	
		case attacks.second:
			//create hitbox on the right frame
			if(floor(x_frame) == 2 && hitbox == -1){
				if(direct == 1){
					hitbox = hitbox_create(12,5,33,18,frm,0.5*direct,0,30,dmg);
				}else{
					hitbox = hitbox_create(12,5,5,18,frm,0.5*direct,0,30,dmg);
				}
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length -2)){
				currentAttack = attacks.third;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				attack = false;
			}
		break;
	
		case attacks.third:
			//create hitbox on the right frame
			if(floor(x_frame) == 2 && hitbox == -1){
				if(direct == 1){
					hitbox = hitbox_create(9,12,35,13,frm,1*direct,-6,30,dmg);
				}else{
					hitbox = hitbox_create(9,12,6,13,frm,1*direct,-6,30,dmg);
				}
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length -2)){
				currentAttack = attacks.first;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				attack = false;
			}
		break;
	}


}
