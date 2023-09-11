///@description dialogue_event_trigger_register
///@arg talker
///@arg dialogue
///@arg quests.quest
///@arg new_dialogue
///@arg event 
///@arg id 
///@arg script 
///@arg arg1...*
function dialogue_event_trigger_register() {

	if(array_equals(oPlayer.lastTalker.dialogue, argument[0].dialogue[argument[1]])){
		ds_quests[# 1, argument[2]] += 1;
		with(argument[0]) dialogue = dialogue[argument[3]];
 

		with(eventmanager){
			var ev = argument[4];
			var objID = argument[5];
	
			if(!ds_map_exists(eventMap, ev)){
				//Add event to map
				var listenerList = ds_list_create();
		
				//Add the list to the eventMap
				ds_map_add_list(eventMap, ev, listenerList)
			}else{
				var listenerList = eventMap[? ev];
			}
	
			//Add listener info
			var listenerInfo;
	
			//Add listener ID
			listenerInfo[0] = objID;
	
			//Add script and arguments
			var len = argument_count - 6;
			var i = 0; repeat(len){
				listenerInfo[i+1] = argument[i+6];
				i++
			}
	
			//Add listener info to the listener list
			ds_list_add(listenerList, listenerInfo);
		}
		return true;
	}



}
