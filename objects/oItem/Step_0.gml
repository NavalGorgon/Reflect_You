//Moving the item when it drops
if (drop_move){
	x+=xSpeed;
	y+=ySpeed;
	ySpeed = approach(ySpeed,4,0.2);
	if(place_meeting(x, y+ySpeed, oSolid)) {
	    while(!place_meeting(x, y+sign(ySpeed), oSolid)){
	        y += sign(ySpeed);
		}
	    ySpeed = 0;
		drop_move = false;
	}
}else{
	
	//Getting sucked in by the Player
	var px = oPlayer.x + 25;
	var py = oPlayer.y + (37/2) + y_offset/2;
	var r = 16;
	
	if(point_in_circle(px,py,x,y,r)){
		
		//On top of the Player
		r = 4;
		if(! point_in_rectangle(px,py,x-r,y-r,x+r,y+r)){
			//move towards the player
			var appx = abs(lengthdir_x(3,point_direction(x,y,px,py)));
			var appy = abs(lengthdir_y(3,point_direction(x,y,px,py)));
			
			x = approach(x, px, appx);
			y = approach(y, py, appy);
			
		}else{
			//pickup
			var in = item_num;
			
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
			
			//Destroy Item after it gets picked up
				if(picked_up){
					instance_destroy();
					show_debug_message("Picked up an item")
				}
			
		}
	}
}