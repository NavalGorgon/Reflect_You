if(!open){
	if(place_meeting(x,y,oPlayer) && oPlayer.interact){
		open = true;
		image_speed = 12/60;
	}
}else if (open && !taken){
	for (i = 0; i < ds_list_size(loot); i += 1){
		var in = ds_list_find_value(loot, i)
			
		with(oInventory){
			var ds_inv = ds_inventory;
			var picked_up = false;
				
			//check if item already in inventory
			var yy = 0; 
			repeat(inv_slots){
				if(ds_inv[# 0, yy] == in){
					ds_inv[# 1, yy] += 1;
					picked_up = true;
					break;
				}else{
					yy += 1;
				}
			}
				
			//otherise, add to an empty slot if there is one
			if(!picked_up){
				yy = 0;
				repeat(inv_slots){
					if(ds_inv[# 0, yy] == item.none){
						ds_inv[# 0, yy] = in;
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					}else{
						yy += 1;
					}
				}
			}				
		}
	}
	taken = true;
}

if (image_index == 3){
	image_speed = 0;
}