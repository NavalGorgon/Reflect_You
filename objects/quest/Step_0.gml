var grid = ds_quests;
var i;

//Iterate through quests
for(i = 0; i < ds_quests_number; i += 1){
	//Get Stage
	var stg = grid[# 1, i];
	if(stg > -1){
		//Get individual stage info
		var stg_list = grid[# 2, i];
		var stg_info = stg_list[stg];
		//Run script based off quest type
		switch(stg_info[0]){
			case type.kill:
				if(!stg_info[5]){
					event_register_script(stg_info[2], quest, kill_count, stg, i)
					stg_info[5] = true;
					stg_list[stg] = stg_info;
					ds_quests[# 2, i] = stg_list;
				}
				if(stg_info[4] >= stg_info[3]){
					next_stage(i)
				}
			break;

			case type.fetch:
				var n;
				for(n = 0; n < oInventory.inv_slots; n += 1){
					if(oInventory.ds_inventory[# 0, n] == stg_info[2]){
						next_stage(i)
					}
				}
			break;
		
			case type.escort:
			break;
			
			case type.travel:
				if(room == stg_info[2]){
					var top_co = stg_info[3];
					var bot_co = stg_info[4];
					if(collision_rectangle(top_co[0],top_co[1],bot_co[0],bot_co[1],oPlayer,false,true)){
						next_stage(i)
					}
				}
			break;
			
			case type.collect:
				var n;
				with(oInventory){
					for(n = 0; n < inv_slots; n += 1){
						if(ds_inventory[# 0, n] == stg_info[2] && ds_inventory[# 1, n] == stg_info[3]){
							with(other){
								next_stage(i)
							}
						}
					}
				}
			break;
		
			case type.unique:
				if(stg_info[2] != -1){
					var script_list = stg_info[2];
					if(is_array(script_list[0])){
						var scr_len = array_length_1d(script_list);
						var i = 0;
						repeat(scr_len){
							var scr = script_list[i];
							var len = array_length_1d(scr);
							if(len == 1){ 
								script_execute(scr[0]); 
							}else{
								var args = array_create(len-1,0);
								array_copy(args, 0, scr, 1, len-1);
								script_execute_alt(scr[0], args);
							}
							i += 1;
						}
					}else{
						var len = array_length_1d(script_list);
						if(len == 1){ 
							script_execute(script_list[0]); 
						}else{
							var args = array_create(len-1,0);
							array_copy(args, 0, script_list, 1, len-1);
							script_execute_alt(script_list[0], args);
						}
					}
				}
				
			break;
			
			case type.talk:
				var talker = stg_info[2];
				var line = stg_info[3];
				if(instance_exists(talker)){
					if(talker.current_quest != -1){
						if(grid[# 3, i] > grid[# 3, talker.current_quest]){
							with(talker){
								current_quest = i
								current_line = line;
							}
						}
					}else{
						with(talker){
							current_quest = i;
							current_line = line;
						}
					}
				}
			break
		}
	}
}