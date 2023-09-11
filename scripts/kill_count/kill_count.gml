///@ description
///@ stage
///@ quest
function kill_count(argument0, argument1) {


	var grid = ds_quests;
	var stg_list = grid[# 2, argument1];
	var stg = argument0
	var stg_info = stg_list[stg];

	show_debug_message("Kill Count")
	stg_info[4] += 1;

	stg_list[stg] = stg_info;
	ds_quests[# 2, argument1] = stg_list;



}
