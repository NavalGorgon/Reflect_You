///@description next_stage
///@arg quests.quest
function next_stage(argument0) {

	with(quest){
		ds_quests[# 1, argument0] += 1;
	}
	return true;


}
