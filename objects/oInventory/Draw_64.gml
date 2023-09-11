#region
if(show_inventory){


//draw inventory
draw_sprite_part_ext(
	sinvent,0,cellsize,0,inv_ui_width,inv_ui_height,
	inv_ui_x,inv_ui_y,scale,scale,c_white,1
);


// Player Info

var info_grid = ds_player_info;

draw_set_font(fntText);
draw_text_color(info_x,info_y,info_grid[# 0,1] + ": " + info_grid[# 1,1], c_black,c_black,c_black,c_black,1);

draw_set_font(fnt_smalldigits);
draw_text_color(
	info_x+(192*scale)+((15+18)*scale*0), info_y,
	string(info_grid[# 1,0]),c_black,c_black,c_black,c_black,1
)

//Item Description

var item_s = ds_inventory[# 0, selected_slot];

draw_set_font(fntText);
draw_text_color(des_x,des_y,ds_items_info[# 0,item_s] + ": " + ds_items_info[# 1,item_s],c_black,c_black,c_black,c_black,1);

//Inventory

var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory; 


repeat (inv_slots) {
	//x,y location
	xx = slots_x + ((cellsize+x_buffer)*ix*scale);
	yy = slots_y + ((cellsize+y_buffer)*iy*scale);
	
	//item 
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod sinv_items_columns)*cellsize;
	sy = (iitem div sinv_items_columns)*cellsize;
	
	//draw slot and item
	draw_sprite_part_ext(sinvent, 0, 0, 0, cellsize, cellsize, xx, yy,  scale, scale, c_white, 1);
	
	switch(ii){
		case selected_slot:
		
			if(iitem > 0){
				draw_sprite_part_ext(sItems, 0, sx, sy, cellsize, cellsize, xx, yy,  scale, scale, c_white, 1);
			}
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(sinvent, 0, 0, 0, cellsize, cellsize, xx, yy,  scale, scale, c_white, 0.4)
			gpu_set_blendmode(bm_normal);
			
		break;
		
		case pickup_slot:
			if(iitem > 0){
				draw_sprite_part_ext(sItems, 0, sx, sy, cellsize, cellsize, xx, yy,  scale, scale, c_white, 0.2);
			}
		break;
		
		default:
		
			if(iitem > 0){
				draw_sprite_part_ext(sItems, 0, sx, sy, cellsize, cellsize, xx, yy,  scale, scale, c_white, 1);
			}
			
		break;
	}
	
	//draw item number
	if(iitem > 0){
		var number = inv_grid[# 1, ii];
		draw_text_color(xx,yy,string(number),c_black,c_black,c_black,c_black,1);
	}
	
	//increment
	ii += 1;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width;
}

if(pickup_slot != -1){
	iitem = inv_grid[# 0, pickup_slot];
	sx = (iitem mod sinv_items_columns)*cellsize;
	sy = (iitem div sinv_items_columns)*cellsize;
	draw_sprite_part_ext(sItems, 0, sx, sy, cellsize, cellsize, mousex, mousey,  scale, scale, c_white, 1);
	
	var inum = inv_grid[# 1, pickup_slot];
	draw_text_color(mousex+(cellsize*scale*0.5),mousey,string(inum),c_black,c_black,c_black,c_black,1);
}
#endregion

//Equipment
#region
var ii, ix, iy, xx, yy, sx, sy, iitem, equip_grid
ii = 0; ix = 0; iy = 0; equip_grid = ds_equip; 


repeat (equip_slots) {
	//x,y location
	xx = equip_x + ((cellsize+x_buffer)*ix*scale);
	yy = equip_y + ((cellsize+y_buffer)*iy*scale);
	
	//item 
	iitem = equip_grid[# ii, 0];
	sx = (iitem mod sinv_items_columns)*cellsize;
	sy = (iitem div sinv_items_columns)*cellsize;
	
	//draw slot and item
	
	if(iitem > 0){
		draw_sprite_part_ext(sinvent, 0, 0, 0, cellsize, cellsize, xx, yy,  scale, scale, c_white, 1);
		draw_sprite_part_ext(sItems, 0, sx, sy, cellsize, cellsize, xx, yy,  scale, scale, c_white, 1);
	}
	
	//increment
	ii += 1;
	ix = ii mod equip_slots_width;
	iy = ii div equip_slots_width;
}
#endregion
}

//HUD
#region
if(room != Menu){
	//Healthbar
	var health_ = ds_player_info[# 1, 2];
	var max_health = ds_player_info[# 1, 5];

	draw_sprite(sHealth_Case,0,10,10);
	draw_sprite_part_ext(sHealth_Bar,0,0,0,(health_/max_health)*hWidth,hHeight,12,11,1,1,c_white,1);

	//Stamina
	var stamina = ds_player_info[# 1, 9];
	var max_stamina = ds_player_info[# 1, 8];

	draw_sprite(sHealth_Case,0,10,22);
	draw_sprite_part_ext(sStamina_Bar,0,0,0,(stamina/max_stamina)*hWidth,hHeight,12,23,1,1,c_white,1);


	
	//Experience

	var level = ds_player_info[# 1, 4];
	var xp = ds_player_info[# 1, 3];
	var xp_to_next = 10*(level*2 + 7);
	var xp_stock = 10*(sqr(level) + 6*level);

	if((xp-xp_stock) >= xp_to_next){
		ds_player_info[# 1, 4] += 1;
	}

	draw_sprite(sHealth_Case,0,10,34);
	draw_sprite_part_ext(sExp_Bar,0,0,0,((xp-xp_stock)/xp_to_next)*hWidth,hHeight,12,35,1,1,c_white,1);
}
#endregion