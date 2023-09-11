function slime_death() {
	xSpeed = 0;


	if (x_frame >= anim_length - 1){
		with(hurtbox){
			instance_destroy();
		}
		instance_destroy();
		show_debug_message("Slime died")
		event_fire(event.slime_dead);
		event_fire(type);
	}

	//drop loot
	if(!loot_drop){
		var i;
		for (i = 0; i < amoG; i += 1) {
			instance_create_layer(x+16,y+12,"Instances",oGold);
		}
		for (i = 0; i < amoS; i += 1) {
			instance_create_layer(x+16,y+12,"Instances",oSilver);
		}
		for (i = 0; i < amoC; i += 1) {
			instance_create_layer(x+16,y+12,"Instances",oCopper);
		}
	
		var inst = instance_create_layer(x+16,y+12,"Instances",oItem);
		with(inst){
			item_num = irandom_range(1,item.height-1);
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);
		}
		//exp
		oInventory.ds_player_info[# 1, 3] += xp_drop;
		loot_drop = true;
	
	}




}
