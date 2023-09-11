//Moving the item when it drops
if (drop_move){
	x+=xSpeed;
	y+=ySpeed;
	ySpeed = approach(ySpeed,4,0.2);
	if(place_meeting(x+xSpeed,y,oSolid)){
		xSpeed = -xSpeed;
	}
	if(place_meeting(x, y+ySpeed, oSolid)) {
	    while(!place_meeting(x, y+sign(ySpeed), oSolid))
	        y += sign(ySpeed);
	    ySpeed = 0;
		drop_move = false;
	}
}else{
	//Getting sucked in by the Player
	var px = oPlayer.x + 37/2;
	var py = oPlayer.y + 25;
	var r = 16;
	
	if(point_in_rectangle(px,py,x-r,y-r,x+r,y+r)){
		
		//On top of the Player
		r = 8;
		if(! point_in_rectangle(px,py,x-r,y-r,x+r,y+r)){
			//move towards the player
			x = approach(x, px, 3);
			y = approach(y, py, 3);
			
		}else{
			//pickup
			with(oInventory){
				var ds_coin = ds_player_info;
				var picked_up = false;
				ds_coin[# 1, 0] += 5;
				picked_up = true;
			}
			//Destroy Item after it gets picked up
				if(picked_up){
					instance_destroy();
					show_debug_message("Picked up an item")
				}
		}
	}
}