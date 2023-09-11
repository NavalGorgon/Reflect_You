
if(keyboard_check_pressed(ord("I"))){
	show_inventory = !show_inventory;
}

if(!show_inventory) exit;

//Inventory
#region
//Selecting slots
#region
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cellsize + x_buffer)*scale;
var cell_ybuff = (cellsize + y_buffer)*scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

if(nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height){
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_ybuff);

	if((sx < cellsize*scale)&&(sy < cellsize*scale)){
		m_slotx = nx;
		m_sloty = ny;
	}
}


//set the selcted slot

	
selected_slot = min(inv_slots-1, m_slotx + (m_sloty*inv_slots_width));

#endregion

//Pickup items
 #region
var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];
var item_grid = ds_items_info;
var info_grid = ds_player_info;

if(pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(ss_item == item.none){
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = item.none;
			inv_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;
			
		}else if (ss_item == inv_grid[# 0, pickup_slot]){
			if(selected_slot != pickup_slot){
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];
				inv_grid[# 0, pickup_slot] = item.none;
				inv_grid[# 1, pickup_slot] = 0;
				
			}
			
			pickup_slot=-1
			
		}else{
			var ss_item_num = inv_grid[# 1, selected_slot];
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = ss_item;
			inv_grid[# 1, pickup_slot] = ss_item_num;
			
		}
	}
}

if(ss_item != item.none){
	//Drop Item into Game World
	if(keyboard_check_pressed(vk_shift)){
		inv_grid[# 1,selected_slot] -= 1;
		//destroy item in inventory if it was the last one
		if (inv_grid[# 1, selected_slot] == 0){ 
			inv_grid[# 0, selected_slot] = item.none; 
		}
		
		//create the item
		var inst = instance_create_layer(oPlayer.x,oPlayer.y,"Instances",oItem);
		with(inst){
			item_num = ss_item;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);
		}
	}
	
	//Drop Item in Inventory
	if(mouse_check_button_pressed(mb_right)){
		pickup_slot = selected_slot;
	}

#endregion
 
//Use items
#region
var equip_grid = ds_equip;
	if(keyboard_check_pressed(ord("E"))){
		switch item_grid[# 2, ss_item]{
			case equipment.healing:
				if(info_grid[# 1, 2] + item_grid[# 3, ss_item] < info_grid[# 1, 5]){
					info_grid[# 1, 2] += item_grid[# 3, ss_item];
				}else{
					info_grid[# 1, 2] = info_grid[# 1, 5];
				}
				inv_grid[# 1, selected_slot] -= 1;
				if (inv_grid[# 1, selected_slot] == 0){ 
					inv_grid[# 0, selected_slot] = item.none; 
				}
			break;
			case equipment.weapon:
				inv_grid[# 1, selected_slot] -= 1;
				if (inv_grid[# 1, selected_slot] == 0){ 
					inv_grid[# 0, selected_slot] = item.none; 
				}
				//pickup
				var in = equip_grid[# 2, 0];
				if(in != 0){
					var picked_up = false;
				
					//check if item already in inventory
					var yy = 0; 
					repeat(inv_slots){
						if(inv_grid[# 0, yy] == in){
							inv_grid[# 1, yy] += 1;
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
							if(inv_grid[# 0, yy] == item.none){
								inv_grid[# 0, yy] = in;
								inv_grid[# 1, yy] += 1;
								picked_up = true;
								break;
							}else{
								yy += 1;
							}
						}
					}	
				}
				equip_grid[# 2, 0] = ss_item;
			break;
			
			case equipment.head:
				inv_grid[# 1, selected_slot] -= 1;
				if (inv_grid[# 1, selected_slot] == 0){ 
					inv_grid[# 0, selected_slot] = item.none; 
				}
				//pickup
				var in = equip_grid[# 0, 0];
				if(in != 0){
					//Reduce armour
					info_grid[# 1, 6] -= (item_grid[# 3, in] +25);
					
					var picked_up = false;
				
					//check if item already in inventory
					var yy = 0; 
					repeat(inv_slots){
						if(inv_grid[# 0, yy] == in){
							inv_grid[# 1, yy] += 1;
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
							if(inv_grid[# 0, yy] == item.none){
								inv_grid[# 0, yy] = in;
								inv_grid[# 1, yy] += 1;
								picked_up = true;
								break;
							}else{
								yy += 1;
							}
						}
					}	
				}
				equip_grid[# 0, 0] = ss_item;
				info_grid[# 1, 6] += (item_grid[# 3, ss_item] + 25);
			break;
			
			case equipment.body:
				inv_grid[# 1, selected_slot] -= 1;
				if (inv_grid[# 1, selected_slot] == 0){ 
					inv_grid[# 0, selected_slot] = item.none; 
				}
				//pickup
				var in = equip_grid[# 3, 0];
				if(in != 0){
					//Reduce armour
					info_grid[# 1, 6] -= (item_grid[# 3, in] +25);
					
					var picked_up = false;
				
					//check if item already in inventory
					var yy = 0; 
					repeat(inv_slots){
						if(inv_grid[# 0, yy] == in){
							inv_grid[# 1, yy] += 1;
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
							if(inv_grid[# 0, yy] == item.none){
								inv_grid[# 0, yy] = in;
								inv_grid[# 1, yy] += 1;
								picked_up = true;
								break;
							}else{
								yy += 1;
							}
						}
					}	
				}
				equip_grid[# 3, 0] = ss_item;
				info_grid[# 1, 6] += (item_grid[# 3, ss_item] + 25);
			break;
			
			case equipment.range:
				inv_grid[# 1, selected_slot] -= 1;
				if (inv_grid[# 1, selected_slot] == 0){ 
					inv_grid[# 0, selected_slot] = item.none; 
				}
				//pickup
				var in = equip_grid[# 1, 0];
				if(in != 0){
					var picked_up = false;
				
					//check if item already in inventory
					var yy = 0; 
					repeat(inv_slots){
						if(inv_grid[# 0, yy] == in){
							inv_grid[# 1, yy] += 1;
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
							if(inv_grid[# 0, yy] == item.none){
								inv_grid[# 0, yy] = in;
								inv_grid[# 1, yy] += 1;
								picked_up = true;
								break;
							}else{
								yy += 1;
							}
						}
					}	
				}
				equip_grid[# 1, 0] = ss_item;
			break;
			
			case equipment.feet:
				inv_grid[# 1, selected_slot] -= 1;
				if (inv_grid[# 1, selected_slot] == 0){ 
					inv_grid[# 0, selected_slot] = item.none; 
				}
				//pickup
				var in = equip_grid[# 5, 0];
				if(in != 0){
					//Reduce armour
					info_grid[# 1, 6] -= (item_grid[# 3, in] +25);
					
					var picked_up = false;
				
					//check if item already in inventory
					var yy = 0; 
					repeat(inv_slots){
						if(inv_grid[# 0, yy] == in){
							inv_grid[# 1, yy] += 1;
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
							if(inv_grid[# 0, yy] == item.none){
								inv_grid[# 0, yy] = in;
								inv_grid[# 1, yy] += 1;
								picked_up = true;
								break;
							}else{
								yy += 1;
							}
						}
					}	
				}
				equip_grid[# 5, 0] = ss_item;
				info_grid[# 1, 6] += (item_grid[# 3, ss_item] + 25);
			break;
			
			case equipment.belt:
				inv_grid[# 1, selected_slot] -= 1;
				if (inv_grid[# 1, selected_slot] == 0){ 
					inv_grid[# 0, selected_slot] = item.none; 
				}
				//pickup
				var in = equip_grid[# 4, 0];
				if(in != 0){
					var picked_up = false;
				
					//check if item already in inventory
					var yy = 0; 
					repeat(inv_slots){
						if(inv_grid[# 0, yy] == in){
							inv_grid[# 1, yy] += 1;
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
							if(inv_grid[# 0, yy] == item.none){
								inv_grid[# 0, yy] = in;
								inv_grid[# 1, yy] += 1;
								picked_up = true;
								break;
							}else{
								yy += 1;
							}
						}
					}	
				}
				equip_grid[# 4, 0] = ss_item;
			break;
		}
		
	}
}
#endregion
 
 #endregion