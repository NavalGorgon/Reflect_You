///@description create_ds_grid_from_array
///@arg array
function create_ds_grid_from_array(argument0) {

	var ds_grid;
	var array = argument0;
	var array_num_quests = array_length_1d(array)
	var array_w = 0

	for (i = 0; i < array_num_quests; i += 1;){
		if(array_length_1d(array[i]) > array_w){
			array_w = array_length_1d(array[i])
		}
	}

	ds_grid = ds_grid_create(array_w,array_num_quests)

	for (i = 0; i < array_num_quests; i += 1;){
		var quest_array = array[i];
		for (j = 0; j < array_length_1d(array[i]); j += 1;){
			ds_grid[# j, i] = quest_array[j];
		}
	}
	
	return ds_grid;


}
