function block_state() {
	if(instance_exists(hurtbox)){
		instance_destroy(hurtbox);
	}
	xSpeed = 0;

	var stamina = oInventory.ds_player_info[# 1, 9];

	if(!block)||(stamina <= 0){
		currentState = states.normal;
		hurtbox = hurtbox_create(17,30,17,6);
		stam_drain -= 1;
	}


}
