function attack_state() {
	//attack state
	var frm = 60/12;
	xSpeed = 0;

	if (x_frame >= anim_length - 0.5) {
		currentState = states.normal;
		currentAttack = attacks.first;
		x_frame = 0;
	}

	var weapon = oInventory.ds_equip[# 2, 0];
	var dmg = oInventory.ds_items_info[# 3, weapon];

	switch(currentAttack){
		case attacks.first:
			//create hitbox on the right frame
			if(floor(x_frame) == 2 && hitbox == -1){
				if (direct == 1){
					hitbox = hitbox_create(27,32,22,0,frm,2*direct,0,30,dmg);
				}else{
					hitbox = hitbox_create(27,32,1,0,frm,2*direct,0,30,dmg);
				}
				if(!audio_is_playing(sword_swing_5)){
				audio_play_sound(sword_swing_5,1,false);
				}
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length - 2)){
				currentAttack = attacks.second;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				attack = false;
			}
		break;
	
		case attacks.second:
			//create hitbox on the right frame
			if(floor(x_frame) == 3 && hitbox == -1){
				if(direct == 1){
					hitbox = hitbox_create(36,29,11,7,frm,2*direct,0,30,dmg);
				}else{
					hitbox = hitbox_create(36,29,2,7,frm,2*direct,0,30,dmg);
				}
				audio_play_sound(sword_swing_4,1,false);
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length - 2)){
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
					hitbox = hitbox_create(48,21,2,13,frm,5*direct,0,30,dmg);
				}else{
					hitbox = hitbox_create(48,21,0,13,frm,5*direct,0,30,dmg);
				}
				audio_play_sound(sword_swing_1,1,false);
			}
		
			//cancel into next attack
			if((attack) && (x_frame > anim_length - 2)){
				currentAttack = attacks.first;
				hitLanded = false;
				hitbox = -1;
				x_frame = 0;
				attack = false;
			}
		break;
	}

	//dash
	if (dash) {
		currentState = states.dash;
		alarm[0] = room_speed/8;
		x_frame = 3;
	}


}
