///@description dialogue_event_trigger
///@arg talker
///@arg dialogue
///@arg quests.quest
///@arg new_dialogue
function dialogue_event_trigger(argument0, argument1, argument2, argument3) {
	if(instance_exists(argument0) && oPlayer.lastTalker != noone){
		if(array_equals(oPlayer.lastTalker.dialogue, argument0.dialogue[argument1])){
			ds_quests[# 1, argument2] += 1;
			with(argument0) dialogue = dialogue[argument3];
	
			return true;
		}
	}


}
